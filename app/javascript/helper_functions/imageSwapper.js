const imageSwapper = () => {
  let bigImage = document.getElementById("img-large");
  let topRight = document.getElementById("top-right");
  let bottomRight = document.getElementById("bottom-right");
  topRight.addEventListener("click", (clickedItem) => {
    const currentSrc = clickedItem.srcElement.currentSrc;
    const bigImageSrc = bigImage.src;
    bigImage.src = currentSrc;
    topRight.src = bigImageSrc;
  });
  bottomRight.addEventListener("click", (clickedItem) => {
    const currentSrc = clickedItem.srcElement.currentSrc;
    const bigImageSrc = bigImage.src;
    bigImage.src = currentSrc;
    bottomRight.src = bigImageSrc;
  });
};

export { imageSwapper };
