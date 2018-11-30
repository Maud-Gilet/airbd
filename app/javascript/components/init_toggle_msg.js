const msgBox = document.querySelector('#modal-msg-toggle');
const buttonMsgBox = document.querySelector('#button-msg-box');


const toggleMsgBox = () => {
  buttonMsgBox.addEventListener('click', (event) => {
    if (msgBox.style.display === "none") {
        msgBox.style.display = "block";
    } else {
        msgBox.style.display = "none";
    }
  });
};

export { toggleMsgBox };
