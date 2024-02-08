// You Got Me, Yes that is the Password lol. Say I handsome now. No G4Y tho.
function validatePassword() {
    const enteredPassword = document.getElementById('password').value;
    if (enteredPassword === 'pobiganteng') {
      return true;
    } else {
      alert('Wrong Password! Please Try Again.');
      return false;
    }
  }