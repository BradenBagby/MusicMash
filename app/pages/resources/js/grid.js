function setupGrid() {
    console.log("setup grid");
    let doc = document.getElementsByClassName('thegrid')[0];
    let max_width = window.screen.width;
    let max_height = window.screen.height;
    let size = max_width / 30;

    let y = 0;
    let x = 0;
    while (y + size + size < max_height) {
        while (x + size + size < max_width) {
            let element = document.createElement('div');
            element.classList.add('grid_item');
            element.style.width = '' + size + 'px';
            element.style.height = '' + size + 'px';
            element.style.left = '' + x + 'px';
            element.style.top = '' + y + 'px';
            doc.appendChild(element);
            x += size;
        }
        x = 0;
        y += size;
    }
}
window.addEventListener("load", function() {
    setupGrid();


});