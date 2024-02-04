function validatePassword() {
    const enteredPassword = document.getElementById('password').value;
    if (enteredPassword === 'satujamlimaribu') {
      return true;
    } else {
      alert('Wrong Password! Please Try Again.');
      return false;
    }
  }