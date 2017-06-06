import math


class Circle:
    radius = None
    color = None

    def __init__(self, radius, color):
        self._radius = radius
        self._color = color

    def calcula_area(self):
        return math.pi * self.radius * self.radius

    def calcula_circunferencia(self):
        return 2 * math.pi * self.radius

    @property
    def radius(self):
        return self._radius

    @radius.setter
    def radius(self, radius):
        self._radius = radius

    @property
    def color(self):
        return self._color

    @color.setter
    def color(self, color):
        self._color = color


c1 = Circle(1, 'red')
c2 = Circle(1, 'green')
c3 = Circle(4, 'red')


print(c1.color)
print(c3.calcula_circunferencia())
print('Areas {}'
      .format('iguais'
              if c3.calcula_area() == c2.calcula_circunferencia()
              else 'diferentes'))
