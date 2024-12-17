def html_to_rgb(color):
    color = color.lstrip('#')
    if len(color) == 3:
        color = ''.join(c*2 for c in color)
    return tuple(int(color[i:i+2], 16) for i in (0, 2, 4))

def rgb_to_html(r, g, b):
    return "#{:02X}{:02X}{:02X}".format(r, g, b)

def html_to_rgb_with_alpha(color):
    color = color.lstrip('#')
    if len(color) == 8:  # Includes alpha channel
        r, g, b = int(color[0:2], 16), int(color[2:4], 16), int(color[4:6], 16)
        a = int(color[6:8], 16) / 255  # Alpha converted to a 0-1 range
        return (r, g, b, round(a, 2))  # RGB + Alpha
    elif len(color) == 6:  # Standard RGB
        return tuple(int(color[i:i+2], 16) for i in (0, 2, 4))
    else:
        raise ValueError("Invalid color format")

print(html_to_rgb_with_alpha("#291F2EF2"))
print(html_to_rgb("#7500A9"))
print(rgb_to_html(76, 0, 110))
