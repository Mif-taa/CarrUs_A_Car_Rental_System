console.log("JS loaded");

const MONTHLY_RATE = 8000;
const DRIVER_SALARY = 3000;

document.addEventListener('DOMContentLoaded', function () {
  document.getElementById('duration').addEventListener('change', calculatePrice);
  document.getElementById('driver').addEventListener('change', calculatePrice);
  calculatePrice();

  document.getElementById('subscription-form').addEventListener('submit', simulatePayment);
});

function calculatePrice() {
  const duration = parseInt(document.getElementById('duration').value);
  const driverNeeded = document.getElementById('driver').value === 'yes';
  let total = MONTHLY_RATE * duration;

  if (driverNeeded) {
    total += DRIVER_SALARY * duration;
  }

  document.getElementById('price').value = total.toFixed(2);
  document.getElementById('amount').value = total.toFixed(2);
}

function simulatePayment(event) {
  event.preventDefault();
  const form = document.getElementById('subscription-form');
  const formData = new FormData(form);

  fetch('process_subscription.php', {
    method: 'POST',
    body: formData
  })
    .then(res => res.json())
    .then(res => {
      if (res.success) {
        alert("Subscription successful!");
        window.location.reload();
      } else {
        alert("Failed: " + res.message);
      }
    })
    .catch(err => {
      console.error("Fetch error:", err);
      alert("Error occurred while processing payment.");
    });
}
