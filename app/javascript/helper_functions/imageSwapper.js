const imageSwapper = () => {
    let bigImage = document.getElementById("img-large");
    let topRight = document.getElementById("right-0");
    let bottomRight = document.getElementById("right-1");
    if (topRight !== null) {
    topRight.addEventListener("click", (clickedItem) => {
      const currentSrc = clickedItem.srcElement.currentSrc;
      const bigImageSrc = bigImage.src;
      bigImage.src = currentSrc;
      topRight.src = bigImageSrc;
    });
  }
  if (bottomRight !== null) {
    bottomRight.addEventListener("click", (clickedItem) => {
      const currentSrc = clickedItem.srcElement.currentSrc;
      const bigImageSrc = bigImage.src;
      bigImage.src = currentSrc;
      bottomRight.src = bigImageSrc;
    });
  }
};

export { imageSwapper };
