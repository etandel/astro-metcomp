from math import log10


class Coords(object):
    def __init__(self, ra, dec):
        self.ra = ra
        self.dec = dec

    def is_austral(self):
        return self.dec < 0


class Astro(Coords):
    def __init__(self, ra, dec, magnitude_v):
        super(Astro, self).__init__(ra, dec)
        self.magnitude_v = magnitude_v


class Star(Astro):
    def __init__(self, ra, dec, magnitude_v, magnitude_b, paralaxe):
        super(Star, self).__init__(ra, dec, magnitude_v)
        self.paralaxe = paralaxe

    def distance(self):
        return 1.0/self.paralaxe

    def absolute_magnitude(self, band='v'):
        mag = self.magnitude_v if band == 'v' else self.magnitude_b
        logd = log10(self.distance())
        return mag - 5 * logd + 5

    def temperature(self):
        return 1e4 - 5e3 * (self.magnitude_b - self.magnitude_v)

