window.addEventListener('DOMContentLoaded', event => {
    const time_range = document.getElementById("B1").value;
    const arr1 = time_range.split(" ");
    const arr2 = arr1[0].split(":");

    const d = new Date();
    const year = d.getFullYear();
    const month = d.getMonth();
    const day = d.getDate();
    let hour = parseInt(arr2[0]);
    if (arr1[1].toLowerCase() === "pm") {
        hour = hour + 12;
    }
    const minutes = arr2[1];
    const seconds = 0;
    const msec = 0;
    const value = new Date(year, month, day, hour, minutes, seconds, msec);
    if (d > value) {
        document.getElementById("B1").setAttribute("disabled", "");
    }
});