C        1         2         3         4         5         6
C2345678901234567890123456789012345678901234567890123456789012345
      PROGRAM TABELA
      IMPLICIT NONE

      INTEGER i
      REAL a, b, x, eps_x, eps_y, F, fa, fb, fx
      LOGICAL finish
      
      WRITE (*,*) "Introduza a tolerancia em x: "
      READ (*,*) eps_x
      WRITE (*,*) "Introduza a tolerancia em y: "
      READ (*,*) eps_y
      
      WRITE (*,*) "Introduza o intervalo [a,b]: "
      WRITE (*,*) "a: "
      READ (*,*) a
      WRITE (*,*) "b: "
      READ (*,*) b
      
      i = 0
      finish = .FALSE.
      DO WHILE (.NOT. finish)
            fa = F(a)
            fb = F(b)
            
            IF (abs(b-a) .LT. eps_x) THEN
                  x = (a+b)/2
                  finish = .TRUE.
            ELSEIF (abs(fa) .LT. eps_y) THEN
                  x = a
                  finish = .TRUE.
            ELSEIF (abs(fb) .LT. eps_y) THEN
                  x = b
                  finish = .TRUE.
            ENDIF

            x = (a * fb - b * fa) / (fb - fa)
            fx = F(x)

            IF (abs(fx) .LT. eps_y) THEN
                  finish = .TRUE.
            ENDIF
            
            IF (fa * fx .GT. 0) THEN
                  a = x
            ELSE
                  b = x
            ENDIF
            
            i = i + 1
      END DO

      WRITE (*,*) "Raiz aproximada (X0): ", x
      WRITE (*,*) "F(X0): ", F(x)
      WRITE (*,*) "Iteracoes", i
      
      END
