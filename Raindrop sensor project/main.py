import network
import time
from umqtt.simple import MQTTClient
from machine import Pin, ADC

SERVER = "mqtt.favoriot.com"
client  = MQTTClient("umqtt_client", SERVER, user="d0V0aeJpNy9ZH5xFyJuFT2qKyoWTK8ph", password="d0V0aeJpNy9ZH5xFyJuFT2qKyoWTK8ph")
wlan = network.WLAN(network.STA_IF)
wlan.active(True)
wlan.disconnect()
#mqtt required info

rain_sensor_adc_pin = ADC(Pin(32))
rain_sensor_digital_pin = Pin(33, Pin.IN)
led = Pin(18, Pin.OUT)
rainingStatus = ''
if not wlan.isconnected():
  print('connecting to network ...')
  wlan.connect('Galaxy Note20 Ultra 5G4fc9','00000000')
  while not wlan.isconnected():
    print("network config:", wlan.ifconfig())
    time.sleep(2)

while wlan.isconnected():
    client.connect()
    print("client connected")
  
    # Read the analog value from the rain sensor ADC pin
    rain_sensor_analog_value = rain_sensor_adc_pin.read()

    # Read the digital value from the rain sensor DO pin
    rain_sensor_digital_value = rain_sensor_digital_pin.value()

    # Check if it is raining based on the sensor values
    if rain_sensor_analog_value < 1000:
        print("\nRaining analog value: " + str(rain_sensor_analog_value))
        print("Raining digital value: " + str(rain_sensor_digital_value))
        print("It is raining heavily!")
        led.on()
    else:
        print("\nRaining analog value: " + str(rain_sensor_analog_value))
        print("Raining digital value: " + str(rain_sensor_digital_value))
        print("It is not raining.")
        led.off()
  
    print("Raining:", rain_sensor_analog_value)
    client.connect()
    client.publish('d0V0aeJpNy9ZH5xFyJuFT2qKyoWTK8ph/v2/streams', '{"device_developer_id": "Arduino@S63190", "data": {"Raining analog values": '+(str(rain_sensor_analog_value))+'}}')
    client.disconnect()

    time.sleep(5)  # Delay聽for聽stability

