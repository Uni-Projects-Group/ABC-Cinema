$(document).ready(function () {
    // Handling the initial form
    $("#continue").click(function () {
        $("#seat-modal").show()
    })

    // Modal close button
    $("#close-modal").click(function () {
        $("#seat-modal").hide()
    })

    $(":checkbox[name='seats']").on('change', function () {
        const seatarr = []
        const price = 4
        $.each($(":checkbox[name='seats']"), function () {
            if (this.checked) {
                seatarr.push($(this).val())
            }
        })
        console.log(seatarr)
        $("#selected").text(seatarr.toString())

        const total = price * seatarr.length
        $("#total").text("$ " + total.toString())
        $("#payable").val(total.toString())
    })
})
