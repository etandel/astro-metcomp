# normalize Glon to (-180, 180)

#hip = na.exclude(hip)
#
#hip$Glon_norm[hip$Glon <= 180] = hip$Glon[hip$Glon <= 180]
#hip$Glon_norm[hip$Glon > 180] = hip$Glon[hip$Glon > 180] - 360

far_from_plane = hip$Glon_norm > -160 & hip$Glon_norm < -140 & hip$Glat > -60 & hip$Glat < -40
near_plane = hip$Glon_norm > -160 & hip$Glon_norm < -140 & hip$Glat > -10 & hip$Glat < 10
plx_correct = hip$Plx > 0

# hip$M = 5 - log10(1000/hip$Plx) + hip$Vmag


plot_m = function(indices) {
    plot(hip$B_V[indices], hip$Vmag[indices],
         xlab="B-V", ylab="magnitude aparente V",
         ylim=rev(range(hip$Vmag[indices])))
}



plot_M = function(indices) {
    plot(hip$B_V[indices], hip$M[indices],
         xlab="B-V", ylab="magnitude absoluta V",
         ylim=rev(range(hip$M[indices])))
}


setEPS()
postscript("hr.eps")
par(mfrow=c(1,2))
plot_M(near_plane)
plot_M(far_from_plane)
dev.off()

#plot(hip$B_V[is_orion], hip$Vmag[is_orion], xlab="B-V", ylab="magnitude aparente V", ylim=rev(range(hip$Vmag[is_orion])))
#plot(hip$B_V[is_orion & hip$Plx > 0], hip$M[is_orion & hip$Plx > 0], xlab="B-V", ylab="magnitude absoluta V", ylim=rev(range(hip$Vmag[is_orion & hip$Plx > 0])))
