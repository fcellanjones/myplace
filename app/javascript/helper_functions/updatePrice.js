const updatePrice = () => {
    // const  = document.getElementById()
    let elements = []
    elements.push(document.getElementById("booking_person_count"))
    elements.push(document.getElementById("booking_start_time"))
    elements.push(document.getElementById("booking_end_time"))
    elements.forEach( element => {
      element.addEventListener("change",() => calculatePrice())
    })

    const calculatePrice = () => {
      const startTime = document.getElementById("booking_start_time").value
      const endTime = document.getElementById("booking_end_time").value
      const personCount = document.getElementById("booking_person_count").value
      const hourlyRate = document.getElementById("price").dataset.rate
      console.log(startTime, endTime, personCount, hourlyRate);
      let calculatedPrice = 0

    if ( startTime.length > 0 && endTime.length > 0 && personCount.length > 0) {

      calculatedPrice = (Date.parse(endTime) -  Date.parse(startTime)) / 3600000 * parseInt(hourlyRate) * parseInt(personCount)
      console.log(Date.parse(endTime), Date.parse(startTime));
    }

    let totalPrice = document.getElementById("total-price")

    totalPrice.innerHTML = `Total: £${calculatedPrice}`

    }
  }

export {updatePrice}
