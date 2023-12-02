function displayTextWithInterval(textArray, interval) {
    let index = 0;
    const outputElement = document.getElementById("ascii");
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

function displayLoading(show) {
    const loadingElement = document.getElementById("spinner");
    //console.log(loadingElement)
    if (show) {
        loadingElement.style.display = "block"; // Show loading element
    } else {
        loadingElement.style.display = "none"; // Hide loading element
    }
}

displayLoading(true);

fetch('/json')
.then(response => response.json())
.then(data => {
    displayLoading(false);
    displayTextWithInterval(data, 150);
})
.catch(error => {
    displayLoading(false);
    console.error('Error uploading JSON:', error);
});
