function displayTextWithInterval(textArray, interval) {
    let index = 0;
    const outputElement = document.getElementById("content");
    function displayNextText() {
        if (index < textArray.length) {
        outputElement.textContent = textArray[index];
        index++;
        setTimeout(displayNextText, interval);
        }
        if (index >= textArray.length) {
            index = 0;
        }
    }
    displayNextText();
}

fetch('/json')
.then(response => response.json())
.then(data => {
    displayTextWithInterval(data, 100);
})
.catch(error => {
    console.error('Error uploading JSON:', error);
});
