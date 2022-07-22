#include "avr/io.h"
#define __SFR_OFFSET 0
.global start
.global led
start:
  sbi DDRB,5
  ret
led:
  cpi r24,0
  breq ledkapat
  sbi PORTB,5
  rcall bekle
  ret
ledkapat:
  cbi PORTB,5
  rcall bekle
  ret
bekle:
  ldi r20,100
dongudisi:
  ldi r30,lo8(20000)
  ldi r31,hi8(20000)
donguici:
  sbiw r30,1
  brne donguici
  subi r20,1
  brne dongudisi
  ret
