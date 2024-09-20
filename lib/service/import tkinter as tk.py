import tkinter as tk

# Create the main window
window = tk.Tk()
window.title("Value Display")

# Create a label to display the value
label = tk.Label(window, text="Current Value: $600", font=("Helvetica", 16))
label.pack(pady=20)

# Start the main loop
window.mainloop()