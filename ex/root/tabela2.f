C        1         2         3         4         5         6
C2345678901234567890123456789012345678901234567890123456789012345
      PROGRAM TABELA
      IMPLICIT NONE
      INTEGER I, N
      REAL A, B, XM, F
      CHARACTER (LEN=128) FNAME

      CALL getarg(1, FNAME)
      IF (FNAME == '') THEN
            FNAME = '/dev/stdout'
      ENDIF
      OPEN(1, FILE=FNAME)

      WRITE (*,*) "Introduza o numero maximo de iteracoes: "
      READ (*,*) N
      WRITE (*,*) "Introduza o intervalo [a,b]: "
      WRITE (*,*) "a: "
      READ (*,*) A
      WRITE (*,*) "b: "
      READ (*,*) B
      
  100 FORMAT (F6.3, A, F6.3)
      DO I = 1, N + 1
            XM = A + (B - A) * (I - 1) / N
            WRITE (1, 100) XM, '|', F(XM)
      END DO
      
      CLOSE (1)
      END
