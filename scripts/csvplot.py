"""
python /u/halle/burgio/home_at/projects/pert/scripts/csvplot.py
"""
import matplotlib.pyplot as plt
import mooseutils

# Create Figure and Axes
figure = plt.figure(facecolor='white')
axes0 = figure.add_subplot(111)

# Read Postprocessor Data
data = mooseutils.PostprocessorReader('peacock_run_exe_tmp_out.csv')
x = data('time')

y = data('eight_pp')
axes0.plot(x, y, label='eight_pp', linestyle='-', linewidth=1, color=[0.122, 0.471, 0.706, 1.0], marker='', markersize=1)

y = data('fifth_pp')
axes0.plot(x, y, label='fifth_pp', linestyle='-', linewidth=1, color=[0.698, 0.875, 0.541, 1.0], marker='', markersize=1)

y = data('first_pp')
axes0.plot(x, y, label='first_pp', linestyle='-', linewidth=1, color=[0.2, 0.627, 0.173, 1.0], marker='', markersize=1)

y = data('fourth_pp')
axes0.plot(x, y, label='fourth_pp', linestyle='-', linewidth=1, color=[0.984, 0.604, 0.6, 1.0], marker='', markersize=1)

y = data('second_pp')
axes0.plot(x, y, label='second_pp', linestyle='-', linewidth=1, color=[0.992, 0.749, 0.435, 1.0], marker='', markersize=1)

y = data('seventh_pp')
axes0.plot(x, y, label='seventh_pp', linestyle='-', linewidth=1, color=[1.0, 0.498, 0.0, 1.0], marker='', markersize=1)

y = data('sixth_pp')
axes0.plot(x, y, label='sixth_pp', linestyle='-', linewidth=1, color=[0.792, 0.698, 0.839, 1.0], marker='', markersize=1)

y = data('third_pp')
axes0.plot(x, y, label='third_pp', linestyle='-', linewidth=1, color=[0.416, 0.239, 0.604, 1.0], marker='', markersize=1)

# x0-axis Settings
axes0.set_xlabel('time')
axes0.set_xlim([-0.00015000000000000001, 0.00315])

# y0-axis Settings
axes0.set_ylabel('eight_pp; fifth_pp; first_pp; fourth_pp; second_pp; seventh_pp; sixth_pp; third_pp')
axes0.set_ylim([-531968.6499408, 11171341.6487568])

# Show figure and write pdf
plt.show()
figure.savefig("output.pdf")