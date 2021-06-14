// function openPopup(link) {
//     link.hide();
//     window.open(link.href,'exam_dialog','toolbar=no, location=no, menubar=no, scrollbars=yes, resizable=no');
//     return false;
// }

// console.log("JS is reached")
// console.log("JS is reached 2nd time")

const openPopup = () => {
  const button = document.querySelector('#add-skill');
  button.addEventListener('click', (event) => {
    event.preventDefault();
    const element = document.querySelector("#popup");
    element.style.display = "flex";
    console.log()
    console.log("It workds")
    const skills = document.querySelectorAll(".container-skills .main-btn");
    skills.forEach( (skill) => {
      skill.addEventListener('click', (event) => {
        element.style.display = "flex";
      });
    });
  });
}


export { openPopup };