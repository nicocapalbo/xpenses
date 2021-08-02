const closeMenu = () => { 
  const menuCloseBTN = document.getElementById('closeMenu');
  const menuOpenBTN = document.getElementById('openMenu');
  const menuBar = document.getElementById('menuBar');

  
    menuCloseBTN.addEventListener('click', () => {
      menuBar.toggleAttribute('hidden')
      // menuBar.classList.toggle('m-fadeOut')
      // menuBar.classList.toggle('m-fadeIn')
    })
    menuOpenBTN.addEventListener('click', () => {
      menuBar.toggleAttribute('hidden')
      // menuBar.classList.toggle('m-fadeOut')
      // menuBar.classList.toggle('m-fadeIn')
    })
 }

export {closeMenu}