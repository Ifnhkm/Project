import { initializeApp } from "https://www.gstatic.com/firebasejs/9.5.0/firebase-app.js";
import { getAuth, signInWithEmailAndPassword, createUserWithEmailAndPassword, signOut } from "https://www.gstatic.com/firebasejs/9.5.0/firebase-auth.js";

function initializeFirebase() {
    const firebaseConfig = {
        apiKey: "AIzaSyAd22DaTidKmnAegLlAJkZMLhkUcuAeJ9E",
        authDomain: "aloha-a9dd0.firebaseapp.com",
        databaseURL: "https://aloha-a9dd0-default-rtdb.asia-southeast1.firebasedatabase.app",
        projectId: "aloha-a9dd0",
        storageBucket: "aloha-a9dd0.appspot.com",
        messagingSenderId: "382680700417",
        appId: "1:382680700417:web:36b00bc4b6c4774da05200",
        measurementId: "G-1C2C9GTWES"
      };

  const app = initializeApp(firebaseConfig);
  const auth = getAuth();

  document.getElementById("reg-btn").addEventListener('click', function () {
    document.getElementById("register-div").style.display = "inline";
    document.getElementById("login-div").style.display = "none";
    window.location.href = "Register.html";
  });

  document.getElementById("log-btn").addEventListener('click', function () {
    document.getElementById("register-div").style.display = "none";
    document.getElementById("login-div").style.display = "inline";
    window.location.href = "Login.html";
  });

  document.getElementById("login-btn").addEventListener('click', function () {
    const loginEmail = document.getElementById("login-email").value;
    const loginPassword = document.getElementById("login-password").value;

    signInWithEmailAndPassword(auth, loginEmail, loginPassword)
      .then((userCredential) => {
        const user = userCredential.user;
        document.getElementById("result-box").style.display = "inline";
        document.getElementById("login-div").style.display = "none";
        document.getElementById("result").innerHTML = "Welcome Back<br>" + loginEmail + " was Login Successfully";
        window.location.href = "HomePage.html";
      })
      .catch((error) => {
        const errorCode = error.code;
        const errorMessage = error.message;
        document.getElementById("result-box").style.display = "inline";
        document.getElementById("login-div").style.display = "none";
        document.getElementById("result").innerHTML = "Sorry ! <br>" + errorMessage;
      });
  });

  document.getElementById("register-btn").addEventListener('click', function () {
    const registerEmail = document.getElementById("register-email").value;
    const registerPassword = document.getElementById("register-password").value;

    createUserWithEmailAndPassword(auth, registerEmail, registerPassword)
      .then((userCredential) => {
        const user = userCredential.user;
        document.getElementById("result-box").style.display = "inline";
        document.getElementById("register-div").style.display = "none";
        document.getElementById("result").innerHTML = "Welcome <br>" + registerEmail + " was Registered Successfully";
        window.location.href = "Login.html";
      })
      .catch((error) => {
        const errorCode = error.code;
        const errorMessage = error.message;
        alert(errorMessage);
      });
  });
}

initializeFirebase();
