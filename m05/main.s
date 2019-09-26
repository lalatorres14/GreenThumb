	.cpu arm7tdmi
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"main.c"
	.text
	.align	2
	.global	goToStart
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToStart, %function
goToStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r3, .L4
	mov	lr, pc
	bx	r3
	ldr	r4, .L4+4
	mov	r3, #256
	mov	r2, #83886080
	ldr	r1, .L4+8
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r3, .L4+12
	mov	r2, #100663296
	ldr	r1, .L4+16
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L4+20
	ldr	r1, .L4+24
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r2, #67108864
	mov	r4, #0
	mov	r1, #7936
	mov	r3, #4352
	strh	r1, [r2, #8]	@ movhi
	strh	r3, [r2]	@ movhi
	strh	r4, [r2, #16]	@ movhi
	mov	r3, #1
	strh	r4, [r2, #18]	@ movhi
	ldr	r5, .L4+28
	ldr	r2, .L4+32
	ldr	r1, .L4+36
	ldr	r0, .L4+40
	mov	lr, pc
	bx	r5
	ldr	r3, .L4+44
	str	r4, [r3]
	pop	{r4, r5, r6, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	waitForVBlank
	.word	DMANow
	.word	introPal
	.word	4384
	.word	introTiles
	.word	100726784
	.word	introMap
	.word	playSoundA
	.word	11025
	.word	605464
	.word	TitleSong_c2
	.word	state
	.size	goToStart, .-goToStart
	.align	2
	.global	initialize
	.syntax unified
	.arm
	.fpu softvfp
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r0, #3
	mov	r2, #1
	ldr	r1, .L7
	ldr	r3, .L7+4
	str	r0, [r1]
	str	r2, [r3]
	b	goToStart
.L8:
	.align	2
.L7:
	.word	livesRemaining
	.word	flowersAlive
	.size	initialize, .-initialize
	.align	2
	.global	goToInstructions
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToInstructions, %function
goToInstructions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r3, #256
	ldr	r4, .L11
	mov	r2, #83886080
	ldr	r1, .L11+4
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r3, .L11+8
	mov	r2, #100663296
	ldr	r1, .L11+12
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L11+16
	ldr	r1, .L11+20
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r2, #1
	ldr	r3, .L11+24
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L12:
	.align	2
.L11:
	.word	DMANow
	.word	instructPal
	.word	5616
	.word	instructTiles
	.word	100726784
	.word	instructMap
	.word	state
	.size	goToInstructions, .-goToInstructions
	.align	2
	.global	start
	.syntax unified
	.arm
	.fpu softvfp
	.type	start, %function
start:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L20
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L20+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L13
	ldr	r3, .L20+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L19
.L13:
	pop	{r4, lr}
	bx	lr
.L19:
	pop	{r4, lr}
	b	goToInstructions
.L21:
	.align	2
.L20:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.size	start, .-start
	.align	2
	.global	goToGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToGame, %function
goToGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r3, #1
	ldr	r2, .L24
	ldr	r1, .L24+4
	ldr	r0, .L24+8
	ldr	r4, .L24+12
	mov	lr, pc
	bx	r4
	mov	r4, #67108864
	mov	r1, #23552
	mov	r2, #4864
	ldr	r3, .L24+16
	ldr	r5, .L24+20
	strh	r1, [r4, #8]	@ movhi
	strh	r2, [r4]	@ movhi
	strh	r3, [r4, #10]	@ movhi
	mov	r2, #83886080
	mov	r3, #256
	ldr	r1, .L24+24
	mov	r0, #3
	mov	lr, pc
	bx	r5
	mov	r3, #3104
	ldr	r2, .L24+28
	ldr	r1, .L24+32
	mov	r0, #3
	mov	lr, pc
	bx	r5
	mov	r3, #2048
	ldr	r2, .L24+36
	ldr	r1, .L24+40
	mov	r0, #3
	mov	lr, pc
	bx	r5
	mov	r3, #4032
	mov	r2, #100663296
	ldr	r1, .L24+44
	mov	r0, #3
	mov	lr, pc
	bx	r5
	mov	r3, #2048
	ldr	r2, .L24+48
	ldr	r1, .L24+52
	mov	r0, #3
	mov	lr, pc
	bx	r5
	mov	r2, #0
	mov	r3, #96
	mov	r1, #2
	ldr	r0, .L24+56
	strh	r2, [r4, #16]	@ movhi
	ldrh	r0, [r0]
	ldr	r2, .L24+60
	strh	r3, [r4, #18]	@ movhi
	strh	r0, [r4, #20]	@ movhi
	strh	r3, [r4, #22]	@ movhi
	str	r1, [r2]
	pop	{r4, r5, r6, lr}
	bx	lr
.L25:
	.align	2
.L24:
	.word	11025
	.word	1918944
	.word	gameSong_c2
	.word	playSoundA
	.word	23048
	.word	DMANow
	.word	cloudsPal
	.word	100696064
	.word	cloudsTiles
	.word	100716544
	.word	cloudsMap
	.word	bgTiles
	.word	100720640
	.word	bgMap
	.word	hOffClouds
	.word	state
	.size	goToGame, .-goToGame
	.align	2
	.global	instructions
	.syntax unified
	.arm
	.fpu softvfp
	.type	instructions, %function
instructions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L35
	ldrh	r3, [r3]
	tst	r3, #8
	bxeq	lr
	ldr	r3, .L35+4
	ldrh	r3, [r3]
	tst	r3, #8
	bxne	lr
	push	{r4, lr}
	ldr	r3, .L35+8
	mov	lr, pc
	bx	r3
	bl	goToGame
	ldr	r3, .L35+12
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L36:
	.align	2
.L35:
	.word	oldButtons
	.word	buttons
	.word	pauseSound
	.word	initGame
	.size	instructions, .-instructions
	.align	2
	.global	goToPause
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToPause, %function
goToPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #67108864
	mov	r2, #0
	mov	r0, #7936
	mov	r1, #4352
	push	{r4, lr}
	strh	r0, [r3, #8]	@ movhi
	strh	r1, [r3]	@ movhi
	strh	r2, [r3, #18]	@ movhi
	ldr	r1, .L39
	strh	r2, [r3, #16]	@ movhi
	mov	lr, pc
	bx	r1
	ldr	r4, .L39+4
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L39+8
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #16
	mov	r2, #83886080
	ldr	r1, .L39+12
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #2400
	mov	r2, #100663296
	ldr	r1, .L39+16
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L39+20
	ldr	r1, .L39+24
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r2, #3
	ldr	r3, .L39+28
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L40:
	.align	2
.L39:
	.word	hideSprites
	.word	DMANow
	.word	shadowOAM
	.word	pausePal
	.word	pauseTiles
	.word	100726784
	.word	pauseMap
	.word	state
	.size	goToPause, .-goToPause
	.align	2
	.global	pause
	.syntax unified
	.arm
	.fpu softvfp
	.type	pause, %function
pause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L54
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L42
	ldr	r2, .L54+4
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L53
.L42:
	tst	r3, #4
	bxeq	lr
	ldr	r3, .L54+4
	ldrh	r3, [r3]
	tst	r3, #4
	bxne	lr
	b	goToStart
.L53:
	push	{r4, lr}
	ldr	r3, .L54+8
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	goToGame
.L55:
	.align	2
.L54:
	.word	oldButtons
	.word	buttons
	.word	unpauseSound
	.size	pause, .-pause
	.align	2
	.global	goToWin
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToWin, %function
goToWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #67108864
	mov	r2, #0
	mov	r0, #7936
	mov	r1, #4352
	push	{r4, lr}
	strh	r0, [r3, #8]	@ movhi
	strh	r1, [r3]	@ movhi
	strh	r2, [r3, #18]	@ movhi
	ldr	r1, .L58
	strh	r2, [r3, #16]	@ movhi
	mov	lr, pc
	bx	r1
	ldr	r4, .L58+4
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L58+8
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #16
	mov	r2, #83886080
	ldr	r1, .L58+12
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #3264
	mov	r2, #100663296
	ldr	r1, .L58+16
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L58+20
	ldr	r1, .L58+24
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r2, #4
	ldr	r3, .L58+28
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L59:
	.align	2
.L58:
	.word	hideSprites
	.word	DMANow
	.word	shadowOAM
	.word	winPal
	.word	winTiles
	.word	100726784
	.word	winMap
	.word	state
	.size	goToWin, .-goToWin
	.align	2
	.global	win
	.syntax unified
	.arm
	.fpu softvfp
	.type	win, %function
win:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L67
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L67+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L60
	ldr	r3, .L67+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L66
.L60:
	pop	{r4, lr}
	bx	lr
.L66:
	mov	r0, #3
	mov	r2, #1
	ldr	r1, .L67+12
	ldr	r3, .L67+16
	pop	{r4, lr}
	str	r0, [r1]
	str	r2, [r3]
	b	goToStart
.L68:
	.align	2
.L67:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	livesRemaining
	.word	flowersAlive
	.size	win, .-win
	.align	2
	.global	goToLose
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToLose, %function
goToLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #67108864
	mov	r2, #0
	mov	r1, #7936
	push	{r4, lr}
	strh	r1, [r3, #8]	@ movhi
	strh	r2, [r3, #18]	@ movhi
	ldr	r1, .L71
	strh	r2, [r3, #16]	@ movhi
	mov	lr, pc
	bx	r1
	ldr	r3, .L71+4
	mov	lr, pc
	bx	r3
	ldr	r4, .L71+8
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L71+12
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	ldr	r1, .L71+16
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #2688
	mov	r2, #100663296
	ldr	r1, .L71+20
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L71+24
	ldr	r1, .L71+28
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r2, #5
	ldr	r3, .L71+32
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L72:
	.align	2
.L71:
	.word	waitForVBlank
	.word	hideSprites
	.word	DMANow
	.word	shadowOAM
	.word	losePal
	.word	loseTiles
	.word	100726784
	.word	loseMap
	.word	state
	.size	goToLose, .-goToLose
	.align	2
	.global	game
	.syntax unified
	.arm
	.fpu softvfp
	.type	game, %function
game:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L90
	mov	lr, pc
	bx	r3
	ldr	r3, .L90+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L90+8
	mov	lr, pc
	bx	r3
	ldr	r4, .L90+12
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L90+16
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r3, .L90+20
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L74
	ldr	r3, .L90+24
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L87
.L74:
	ldr	r3, .L90+28
	ldr	r3, [r3]
	cmp	r3, #9
	beq	.L88
.L76:
	ldr	r3, .L90+32
	ldr	r3, [r3]
	cmp	r3, #0
	blt	.L79
	ldr	r3, .L90+36
	mov	lr, pc
	bx	r3
	cmp	r0, #0
	bne	.L89
.L79:
	pop	{r4, lr}
	b	goToLose
.L89:
	pop	{r4, lr}
	bx	lr
.L88:
	ldr	r3, .L90+40
	mov	lr, pc
	bx	r3
	cmp	r0, #1
	bne	.L76
	bl	goToWin
	b	.L76
.L87:
	ldr	r3, .L90+44
	mov	lr, pc
	bx	r3
	bl	goToPause
	b	.L74
.L91:
	.align	2
.L90:
	.word	updateGame
	.word	draw
	.word	waitForVBlank
	.word	DMANow
	.word	shadowOAM
	.word	oldButtons
	.word	buttons
	.word	flowersAlive
	.word	livesRemaining
	.word	countFlowers
	.word	allGrown
	.word	pauseSound
	.size	game, .-game
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	ip, #3
	mov	r1, #1
	ldr	r0, .L104
	ldr	r2, .L104+4
	push	{r4, r7, fp, lr}
	ldr	r3, .L104+8
	str	ip, [r0]
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	ldr	r3, .L104+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L104+16
	mov	lr, pc
	bx	r3
	ldr	r6, .L104+20
	ldr	r8, .L104+24
	ldr	r5, .L104+28
	ldr	fp, .L104+32
	ldr	r10, .L104+36
	ldr	r9, .L104+40
	ldr	r7, .L104+44
	ldr	r4, .L104+48
.L93:
	ldr	r2, [r6]
	ldrh	r3, [r8]
.L94:
	strh	r3, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [r8]	@ movhi
	cmp	r2, #5
	ldrls	pc, [pc, r2, asl #2]
	b	.L94
.L96:
	.word	.L100
	.word	.L99
	.word	.L98
	.word	.L97
	.word	.L95
	.word	.L95
.L95:
	mov	lr, pc
	bx	r7
	b	.L93
.L97:
	ldr	r3, .L104+52
	mov	lr, pc
	bx	r3
	b	.L93
.L98:
	mov	lr, pc
	bx	r9
	b	.L93
.L99:
	mov	lr, pc
	bx	r10
	b	.L93
.L100:
	mov	lr, pc
	bx	fp
	b	.L93
.L105:
	.align	2
.L104:
	.word	livesRemaining
	.word	flowersAlive
	.word	goToStart
	.word	setupSounds
	.word	setupInterrupts
	.word	state
	.word	buttons
	.word	oldButtons
	.word	start
	.word	instructions
	.word	game
	.word	win
	.word	67109120
	.word	pause
	.size	main, .-main
	.text
	.align	2
	.global	lose
	.syntax unified
	.arm
	.fpu softvfp
	.type	lose, %function
lose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	win
	.size	lose, .-lose
	.comm	vOff,4,4
	.comm	hOff,4,4
	.comm	buffer,41,4
	.global	spaceSoundToPlay
	.comm	spaceSoundLen,4,4
	.comm	spaceSound,4,4
	.comm	flowersAlive,4,4
	.comm	livesRemaining,4,4
	.comm	seed,4,4
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	state,4,4
	.comm	soundB,32,4
	.comm	soundA,32,4
	.bss
	.align	2
	.type	spaceSoundToPlay, %object
	.size	spaceSoundToPlay, 4
spaceSoundToPlay:
	.space	4
	.ident	"GCC: (devkitARM release 50) 8.2.0"
