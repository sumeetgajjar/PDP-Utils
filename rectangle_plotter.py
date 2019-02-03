import matplotlib.pyplot as plt
from matplotlib import ticker
from matplotlib.patches import Rectangle


def plot_rectangles(rect1, rect2):
    plt.clf()
    fig = plt.figure()
    ax = fig.add_subplot(111)
    ax.xaxis.set_major_locator(ticker.MultipleLocator(2))
    ax.yaxis.set_major_locator(ticker.MultipleLocator(2))
    ax.add_patch(Rectangle((rect1['x'], rect1['y']), rect1['w'], rect1['h'], color='red', alpha=0.5))
    ax.add_patch(Rectangle((rect2['x'], rect2['y']), rect2['w'], rect2['h'], color='yellow', alpha=0.5))
    plt.xlim([min(rect1['x'], rect2['x']) - 10, max(rect1['x'] + rect1['w'], rect2['x'] + rect2['w']) + 10])
    plt.ylim([min(rect1['y'], rect2['y']) - 10, max(rect1['y'] + rect1['h'], rect2['y'] + rect2['h']) + 10])
    plt.grid(True)
    plt.show()


while True:
    args = input("Enter the rect coordinates: x_1 y_1 w_1 h_1 x_2 y_2 w_2 h_2: ")
    temp_list = [int(arg) for arg in args.split(",")][:4]
    _rect1 = {
        'x': temp_list[0],
        'y': temp_list[1],
        'w': temp_list[2],
        'h': temp_list[3]
    }

    temp_list = [int(arg) for arg in args.split(",")][4:8]
    _rect2 = {
        'x': temp_list[0],
        'y': temp_list[1],
        'w': temp_list[2],
        'h': temp_list[3]
    }

    print("Rect1 x:{x}, y:{y}, w:{w}, h:{h}".format(**_rect1))
    print("Rect2 x:{x}, y:{y}, w:{w}, h:{h}".format(**_rect2))
    plot_rectangles(_rect1, _rect2)
