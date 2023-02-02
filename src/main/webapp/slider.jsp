<!-- Slideshow container -->
<div class="slideshow-container">

    <!-- Full-width images with number and caption text -->

    <div class="mySlides fade">
        <div class="numbertext"><h2>Avatar</h2></div>
        <img src="images/avatarrBan.jpg" style="width:100%; height:500px;">
    </div>

    <div class="mySlides fade">
        <div class="numbertext"><h2>Puss in Boots</h2></div>
        <img src="images/pussinbootsBan.jpg" style="width:100%; height:500px;">

    </div>

    <div class="mySlides fade">
        <div class="numbertext"><h2>Strange World</h2></div>
        <img src="images/StrangeWorldBan.jpg" style="width:100%; height:500px;">

    </div>

    <!-- Next and previous buttons
    <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
    <a class="next" onclick="plusSlides(1)">&#10095;</a> -->
</div>
<br>
<script>

    let slideIndex = 0;
    showSlides();
    function showSlides() {
        let i;
        let slides = document.getElementsByClassName("mySlides");
        for (i = 0; i < slides.length; i++) {
            slides[i].style.display = "none";
        }
        slideIndex++;
        if (slideIndex > slides.length) {slideIndex = 1}
        slides[slideIndex-1].style.display = "block";
        setTimeout(showSlides, 5000); // Change image every 5 seconds
    }

</script>
