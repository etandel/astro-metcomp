C        1         2         3         4         5         6
C2345678901234567890123456789012345678901234567890123456789012345
      PROGRAM TABELA
      IMPLICIT NONE
      INTEGER I, N
      REAL X0, X1, XM, F
      DATA X0 /-2.0/, X1 /5.0/, N /20/
      
      DO I = 1, N + 1
            XM = X0 + (X1 - X0) * (I - 1) / N
            WRITE (*,*) XM, " ", F(XM)
      END DO
      END
C Funcoes e subrotinas costumam ser definidas abaixo do programa
      REAL FUNCTION F(X)
      F = 1 - (1.0 / 20) * EXP(X) + SIN(X / 2.0)
      RETURN
      END
