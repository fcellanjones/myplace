const termsConditions = () => {
  const submitButton = document.querySelector('#tos_btn');
  const terms = document.querySelector("#tos_check")

  const enableButton = () => {
      if (terms.checked == false) {
      submitButton.disabled = true;
    } else {
      submitButton.disabled = false;
    }
  }
terms.addEventListener('click', enableButton);
};


export { termsConditions }
