C        1         2         3         4         5         6
C2345678901234567890123456789012345678901234567890123456789012345
      PROGRAM TABELA
      IMPLICIT NONE
      INTEGER i
      REAL a, b, X, eps_x, eps_y, F, M
      LOGICAL teste1, teste2, teste3
      
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

      teste1 = (abs(b-a) .GT. eps_x)
      teste2 = ((abs(F(a)) .GT. eps_y))
      teste3 = ((abs(F(b)) .GT. eps_y))
      DO WHILE (teste1 .AND. teste2 .AND. teste3)
            M = F(a)
            x = (a*F(b)-b*F(a))/(F(b)-F(a))

            IF ((abs(F(x)) .LT. eps_y)) THEN
                  WRITE (*,*) "Raiz aproximada (X0): ", x
                  WRITE (*,*) "F(X0): ", F(x)
                  WRITE (*,*) "Iteracoes", i
                  STOP
            ENDIF
            IF (M * F(x) .GT. 0) THEN
                  a = x
            ELSE
                  b = x
            ENDIF
            
            i = i + 1
            
            teste1 = (ABS(b-a) .GT. eps_x)
            teste2 = ((abs(F(a)) .GT. eps_y))
            teste3 = ((abs(F(b)) .GT. eps_y))
      END DO

      IF (.NOT. teste1) THEN
            x = (a+b)/2
      ENDIF
      IF (.NOT. teste2) THEN
            x = a
      ENDIF
      IF (.NOT. teste3) THEN
            x = b
      ENDIF
      
      WRITE (*,*) "Raiz aproximada (X0): ", x
      WRITE (*,*) "F(X0): ", F(x)
      WRITE (*,*) "Iteracoes", i
      
      END
