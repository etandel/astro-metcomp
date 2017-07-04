C        1         2         3         4         5         6
C2345678901234567890123456789012345678901234567890123456789012345
      PROGRAM TABELA
      IMPLICIT NONE
      INTEGER I
      DOUBLE PRECISION A, B, X, EPS, F
      
      WRITE (*,*) "Introduza a tolerancia: "
      READ (*,*) EPS
      WRITE (*,*) "Introduza o intervalo [a,b]: "
      WRITE (*,*) "a: "
      READ (*,*) A
      WRITE (*,*) "b: "
      READ (*,*) B
      
      I = 0
      WRITE (*,*) EPS
      DO WHILE (ABS(B - A) .GT. EPS)
            X = (A + B) / 2.0
            WRITE (*,*) X, F(X), EXP(X), SIN(X / 2.0)
            IF (F(A) * F(X) .GT. 0.0) THEN
                  A = X
            ELSE
                  B = X
            ENDIF
            I = I + 1
      END DO
      
      X = (A + B) / 2
      WRITE (*,*) "Raiz aproximada (X0): ", X
      WRITE (*,*) "F(X0): ", F(X)
      WRITE (*,*) "Iteracoes", I
      
      END
