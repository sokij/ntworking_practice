import tkinter as tk
import datetime

# Get the current time and date in Germany (DE)
now = datetime.datetime.now()
de_time = now.strftime("%H:%M:%S")
de_date = now.strftime("%d.%m.%Y")

# Create the main window
window = tk.Tk()
window.title("Weight Display")

# Set the window background color
window.configure(bg="cyan")

# Create a label to display the weight, time, and date
label_text = f"Current Weight: 600 lbs\nDate: {de_date}\nTime (DE): {de_time}"
label = tk.Label(window, text=label_text, font=("Helvetica", 16), bg="cyan", fg="black")
label.pack(pady=20)

# Start the main loop
window.mainloop()