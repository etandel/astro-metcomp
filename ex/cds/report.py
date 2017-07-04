import math
from pprint import pprint


def proper_motion(mi_ra, mi_dec):
    return math.hypot(mi_ra, mi_dec)


def tangential_velocity(parallax, proper_motion):
    return 4.74 * proper_motion / parallax


def spatial_velocity(v_t, v_r):
    return math.hypot(v_t, v_r)


def summarize(star):
    mi = proper_motion(star['mi_ra'], star['mi_dec'])
    vt = tangential_velocity(star['parallax'], mi)
    v = spatial_velocity(vt, star['radial_velocity'])

    return dict(star,
                proper_motion=mi,
                tangential_velocity=vt,
                spatial_velocity=v)


star = {
    'name': 'alf Cen',
    'radial_velocity': -22.3,
    'mi_ra': -3608.0,
    'mi_dec': 686.0,
    'parallax': 742.0,
}


pprint(summarize(star))
