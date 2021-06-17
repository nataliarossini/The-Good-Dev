// function openPopup(link) {
//     link.hide();
//     window.open(link.href,'exam_dialog','toolbar=no, location=no, menubar=no, scrollbars=yes, resizable=no');
//     return false;
// }

// console.log("JS is reached")
// console.log("JS is reached 2nd time")

const openPopupForSkills = () => {
  const button = document.querySelector('#add-skill');
  button.addEventListener('click', (event) => {
    event.preventDefault();
    const element = document.querySelector("#popup-skills");
    element.style.display = "flex";
    const skills = document.querySelectorAll(".container-skills .main-btn");
    skills.forEach( (skill) => {
      skill.addEventListener('click', (event) => {
        element.style.display = "flex";
      });
    });
  });
}

const openPopupForLanguagess = () => {
  const button = document.querySelector('#add-language');
  button.addEventListener('click', (event) => {
    event.preventDefault();
    const element = document.querySelector("#popup-languages");
    element.style.display = "flex";
    const languages = document.querySelectorAll(".container-languages .main-btn");
    languagess.forEach( (language) => {
      language.addEventListener('click', (event) => {
        element.style.display = "flex";
      });
    });
  });
}

const badgeHoverOverEffect = () => {
  if (document.querySelector('#reviewer')) {
    const reviewer = document.querySelector('#reviewer');
    reviewer.addEventListener('mouseover', (event) => {
      const descr = document.querySelector('#reviewer-js');
      descr.style.display = "inline";
    });
    reviewer.addEventListener('mouseout', (event) => {
      const descr = document.querySelector('#reviewer-js');
      descr.style.display = "none";
    });
  }

  if (document.querySelector('#experienced')) {
    const experienced = document.querySelector('#experienced');
    experienced.addEventListener('mouseover', (event) => {
      const descr = document.querySelector('#experienced-js');
      descr.style.display = "inline";
    });
    experienced.addEventListener('mouseout', (event) => {
      const descr = document.querySelector('#experienced-js');
      descr.style.display = "none";
    });
  }

  if (document.querySelector('#top_rated')) {
    const top_rated = document.querySelector('#top_rated');
    top_rated.addEventListener('mouseover', (event) => {
      const descr = document.querySelector('#top_rated-js');
      descr.style.display = "inline";
    });
    top_rated.addEventListener('mouseout', (event) => {
      const descr = document.querySelector('#top_rated-js');
      descr.style.display = "none";
    });
  }
}


export { openPopupForSkills, openPopupForLanguagess, badgeHoverOverEffect };