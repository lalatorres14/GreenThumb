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
	.file	"game.c"
	.text
	.align	2
	.global	initLives
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initLives, %function
initLives:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r1, #16
	mov	r2, #1
	mov	r0, #0
	mov	r4, #30
	mov	lr, #50
	mov	ip, #70
	ldr	r3, .L4
	str	r4, [r3, #4]
	str	lr, [r3, #28]
	str	r0, [r3]
	str	r0, [r3, #24]
	str	r0, [r3, #48]
	str	ip, [r3, #52]
	str	r1, [r3, #12]
	str	r1, [r3, #8]
	str	r1, [r3, #36]
	str	r1, [r3, #32]
	str	r1, [r3, #60]
	str	r1, [r3, #56]
	str	r2, [r3, #20]
	str	r2, [r3, #16]
	str	r2, [r3, #44]
	str	r2, [r3, #40]
	str	r2, [r3, #68]
	str	r2, [r3, #64]
	pop	{r4, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	lives
	.size	initLives, .-initLives
	.align	2
	.global	updateLives
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateLives, %function
updateLives:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L11
	ldr	r3, [r3]
	cmp	r3, #2
	beq	.L10
	cmp	r3, #1
	bne	.L9
	mov	r2, #0
	ldr	r3, .L11+4
	str	r2, [r3, #44]
	bx	lr
.L9:
	cmp	r3, #0
	ldreq	r2, .L11+4
	streq	r3, [r2, #20]
	bx	lr
.L10:
	mov	r2, #0
	ldr	r3, .L11+4
	str	r2, [r3, #68]
	bx	lr
.L12:
	.align	2
.L11:
	.word	livesRemaining
	.word	lives
	.size	updateLives, .-updateLives
	.align	2
	.global	drawLives
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawLives, %function
drawLives:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	mov	r5, #512
	mov	r4, #0
	ldr	r3, .L19
	ldr	r2, .L19+4
	ldr	lr, .L19+8
	add	r0, r3, #24
.L16:
	ldr	r1, [r2, #20]
	cmp	r1, #0
	ldrne	r1, [r2, #4]
	ldrbne	ip, [r2]	@ zero_extendqisi2
	andne	r1, r1, lr
	orrne	r1, r1, #16384
	strhne	r4, [r3, #20]	@ movhi
	strhne	r1, [r3, #18]	@ movhi
	strhne	ip, [r3, #16]	@ movhi
	strheq	r5, [r3, #16]	@ movhi
	add	r3, r3, #8
	cmp	r3, r0
	add	r2, r2, #24
	bne	.L16
	pop	{r4, r5, lr}
	bx	lr
.L20:
	.align	2
.L19:
	.word	shadowOAM
	.word	lives
	.word	511
	.size	drawLives, .-drawLives
	.align	2
	.global	initWaterTracker
	.syntax unified
	.arm
	.fpu softvfp
	.type	initWaterTracker, %function
initWaterTracker:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #0
	push	{r4, lr}
	mov	r2, r3
	mov	r4, #8
	mov	lr, r3
	ldr	r1, .L25
	sub	ip, r1, #8
	sub	r0, r1, #4
.L22:
	add	r3, r3, #1
	cmp	r3, #50
	str	r4, [r1, r2]
	str	r3, [ip, r3, lsl #4]
	lsl	r2, r3, #4
	str	lr, [r0, r3, lsl #4]
	bne	.L22
	pop	{r4, lr}
	bx	lr
.L26:
	.align	2
.L25:
	.word	tracker
	.size	initWaterTracker, .-initWaterTracker
	.align	2
	.global	drawWaterTracker
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawWaterTracker, %function
drawWaterTracker:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r0, #32768
	mov	r1, #49152
	mov	r2, #28
	ldr	r3, .L28
	strh	r0, [r3, #8]	@ movhi
	strh	r1, [r3, #10]	@ movhi
	strh	r2, [r3, #12]	@ movhi
	bx	lr
.L29:
	.align	2
.L28:
	.word	shadowOAM
	.size	drawWaterTracker, .-drawWaterTracker
	.align	2
	.global	updateWaterTracker
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateWaterTracker, %function
updateWaterTracker:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, lr}
	mov	r5, #1
	mov	r1, #54
	mov	r7, #0
	mov	r6, #512
	mov	r4, #3
	ldr	r3, .L36
	ldr	lr, [r3, #28]
	ldr	r3, .L36+4
	add	lr, lr, lr, lsr #31
	ldr	r2, .L36+8
	ldr	r8, .L36+12
	asr	lr, lr, r5
	add	r9, r3, #800
.L33:
	ldr	r0, [r3, #8]
	cmp	r0, lr
	ldrle	r0, [r3]
	strle	r1, [r3, #4]
	orr	ip, r1, #16384
	andle	r0, r0, r8
	strle	r5, [r3, #12]
	strgt	r7, [r3, #12]
	add	r3, r3, #16
	strhle	ip, [r2, #240]	@ movhi
	strhle	r4, [r2, #244]	@ movhi
	strhle	r0, [r2, #242]	@ movhi
	strhgt	r6, [r2, #240]	@ movhi
	cmp	r3, r9
	sub	r1, r1, #1
	add	r2, r2, #8
	bne	.L33
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L37:
	.align	2
.L36:
	.word	player
	.word	tracker
	.word	shadowOAM
	.word	511
	.size	updateWaterTracker, .-updateWaterTracker
	.align	2
	.global	initPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	initPlayer, %function
initPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	mov	r2, #0
	mov	r4, #32
	mov	lr, #1
	mov	r5, #10
	mov	ip, #100
	ldr	r3, .L40
	ldr	r0, [r3]
	ldr	r3, .L40+4
	ldr	r1, [r3]
	ldr	r3, .L40+8
	add	r0, r0, #40
	add	r1, r1, #104
	str	r5, [r3, #20]
	str	r4, [r3, #12]
	str	r4, [r3, #16]
	str	lr, [r3, #8]
	str	lr, [r3, #32]
	stm	r3, {r0, r1}
	str	ip, [r3, #24]
	str	ip, [r3, #28]
	str	r2, [r3, #44]
	str	r2, [r3, #48]
	str	r2, [r3, #52]
	pop	{r4, r5, lr}
	bx	lr
.L41:
	.align	2
.L40:
	.word	vOff
	.word	hOff
	.word	player
	.size	initPlayer, .-initPlayer
	.align	2
	.global	drawPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawPlayer, %function
drawPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r1, .L46
	add	r3, r1, #52
	ldm	r3, {r3, ip}
	ldr	r2, [r1, #48]
	cmp	ip, #0
	ldr	r0, [r1, #40]
	lsl	r3, r3, #5
	add	r3, r3, #16
	addne	r2, r2, ip, lsl #1
	addne	r3, r2, r3
	lsl	r0, r0, #23
	str	lr, [sp, #-4]!
	addeq	r3, r3, r2
	ldrne	r2, .L46+4
	ldreq	r2, .L46+4
	ldrb	lr, [r1, #36]	@ zero_extendqisi2
	lslne	r3, r3, #2
	lsr	r0, r0, #23
	orr	r0, r0, #32768
	lsleq	r3, r3, #2
	orrne	r3, r3, #4096
	strh	lr, [r2]	@ movhi
	strh	r3, [r2, #4]	@ movhi
	strh	r0, [r2, #2]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L47:
	.align	2
.L46:
	.word	player
	.word	shadowOAM
	.size	drawPlayer, .-drawPlayer
	.align	2
	.global	initDrops
	.syntax unified
	.arm
	.fpu softvfp
	.type	initDrops, %function
initDrops:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	mov	r2, #81
	mov	r0, #0
	mov	ip, #8
	mov	lr, #2
	ldr	r3, .L52
.L49:
	ldr	r1, [r3, #24]
	str	r2, [r3, #40]
	add	r2, r2, #1
	rsb	r1, r1, #0
	cmp	r2, #96
	str	r0, [r3, #4]
	str	ip, [r3, #28]
	str	lr, [r3, #16]
	str	r0, [r3, #20]
	str	r0, [r3, #32]
	str	r1, [r3]
	str	ip, [r3, #24]
	add	r3, r3, #44
	bne	.L49
	ldr	lr, [sp], #4
	bx	lr
.L53:
	.align	2
.L52:
	.word	drops
	.size	initDrops, .-initDrops
	.align	2
	.global	drawDrops
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawDrops, %function
drawDrops:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #32]
	cmp	r3, #0
	beq	.L55
	mov	ip, #2
	ldr	r3, [r0, #40]
	ldr	r1, .L61
	str	lr, [sp, #-4]!
	lsl	r3, r3, #3
	ldr	lr, [r0]
	ldr	r0, [r0, #4]
	add	r2, r1, r3
	strh	lr, [r1, r3]	@ movhi
	strh	r0, [r2, #2]	@ movhi
	strh	ip, [r2, #4]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L55:
	ldr	r3, [r0, #36]
	cmp	r3, #0
	moveq	r1, #512
	ldreq	r3, [r0, #40]
	ldreq	r2, .L61
	lsleq	r3, r3, #3
	strheq	r1, [r2, r3]	@ movhi
	bx	lr
.L62:
	.align	2
.L61:
	.word	shadowOAM
	.size	drawDrops, .-drawDrops
	.align	2
	.global	fireDrops
	.syntax unified
	.arm
	.fpu softvfp
	.type	fireDrops, %function
fireDrops:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r0, .L77
	mov	r3, #0
	mov	r2, r0
	b	.L67
.L64:
	add	r3, r3, #1
	cmp	r3, #15
	add	r2, r2, #44
	bxeq	lr
.L67:
	ldr	r1, [r2, #32]
	cmp	r1, #0
	bne	.L64
	ldr	r1, .L77+4
	push	{r4, lr}
	lsl	r2, r3, #2
	ldr	r4, [r1, #48]
	ldr	lr, [r1, #36]
	add	ip, r2, r3
	add	ip, r3, ip, lsl #1
	cmp	r4, #0
	add	lr, lr, #6
	str	lr, [r0, ip, lsl #2]
	ldr	ip, [r1, #40]
	mov	lr, #1
	ldrne	r1, [r1, #12]
	addne	ip, ip, r1
	mov	r1, #0
	add	r2, r2, r3
	add	r3, r3, r2, lsl lr
	add	r3, r0, r3, lsl #2
	str	lr, [r3, #32]
	str	ip, [r3, #4]
	str	r1, [r3, #36]
	pop	{r4, lr}
	bx	lr
.L78:
	.align	2
.L77:
	.word	drops
	.word	player
	.size	fireDrops, .-fireDrops
	.align	2
	.global	updatePlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	updatePlayer, %function
updatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	r3, .L134
	ldr	r4, .L134+4
	ldrh	r3, [r3, #48]
	ldr	r2, [r4, #44]
	ands	r3, r3, #32
	add	r2, r2, #1
	str	r2, [r4, #44]
	bne	.L127
	ldr	r1, [r4, #4]
	cmp	r1, #0
	ble	.L127
	ldr	r5, .L134+8
	ldr	r0, [r4, #8]
	ldr	ip, [r5]
	sub	r1, r1, r0
	cmp	ip, #0
	str	r3, [r4, #48]
	str	r1, [r4, #4]
	ble	.L83
	ldr	r3, [r4, #40]
	cmp	r3, #119
	bgt	.L83
	ldr	r3, .L134+12
	sub	ip, ip, r0
	str	ip, [r5]
	add	ip, r3, #576
.L84:
	ldr	r1, [r3, #4]
	add	r1, r1, r0
	str	r1, [r3, #4]
	add	r3, r3, #64
	cmp	r3, ip
	bne	.L84
	ldr	r3, .L134+16
	add	ip, r3, #660
.L86:
	ldr	r1, [r3, #32]
	cmp	r1, #1
	ldreq	r1, [r3, #4]
	addeq	r1, r1, r0
	streq	r1, [r3, #4]
	add	r3, r3, #44
	cmp	ip, r3
	bne	.L86
	b	.L83
.L127:
	ldr	r5, .L134+8
.L83:
	ldr	r3, .L134
	ldrh	r3, [r3, #48]
	tst	r3, #16
	bne	.L82
	ldr	r1, [r4, #4]
	ldr	r3, [r4, #12]
	add	r3, r1, r3
	cmp	r3, #512
	blt	.L129
.L82:
	ldr	r1, .L134
	ldrh	r3, [r1, #48]
	ands	r6, r3, #1
	ldr	r0, [r4, #20]
	bne	.L130
	cmp	r0, #9
	bgt	.L131
	ldr	lr, [r4, #56]
	add	r0, r0, #1
.L95:
	ldr	r3, .L134
	ldr	ip, [r4, #4]
	ldrh	r3, [r3, #48]
.L97:
	ldr	r3, .L134+20
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L103
	ldr	r3, .L134+24
	ldrh	r3, [r3]
	tst	r3, #4
	bne	.L103
	rsbs	lr, lr, #1
	movcc	lr, #0
	mov	r3, #100
	str	lr, [r4, #56]
	str	r3, [r4, #28]
.L103:
	ldr	r3, .L134+28
	smull	r1, r6, r2, r3
	asr	r1, r2, #31
	rsb	r3, r1, r6, asr #3
	add	r3, r3, r3, lsl #2
	add	r3, r3, r3, lsl #2
	sub	r3, r2, r3
	orrs	r3, r3, lr
	bne	.L104
	add	r1, r4, #28
	ldmia	r1, {r1, r2}
	sub	r2, r1, r2
	str	r3, [r4, #44]
	str	r2, [r4, #28]
.L105:
	ldr	r3, [r4, #52]
	cmp	r3, #1
	moveq	r3, #0
	streq	r3, [r4, #52]
.L106:
	ldr	r3, .L134+32
	ldr	r2, [r5]
	ldr	r1, [r3]
	ldr	r3, [r4]
	sub	ip, ip, r2
	sub	r3, r3, r1
	str	ip, [r4, #40]
	str	r0, [r4, #20]
	str	r3, [r4, #36]
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L131:
	ldr	r3, [r4, #28]
	cmp	r3, #4
	bgt	.L132
	ldrh	r3, [r1, #48]
	tst	r3, #2
	ldr	ip, [r4, #4]
	ldr	lr, [r4, #56]
	beq	.L98
.L128:
	add	r0, r0, #1
	b	.L97
.L129:
	mov	ip, #1
	ldr	r0, [r4, #8]
	ldr	r3, [r5]
	add	r1, r1, r0
	cmp	r3, #272
	str	r1, [r4, #4]
	str	ip, [r4, #48]
	bge	.L82
	ldr	r1, [r4, #40]
	cmp	r1, #120
	ble	.L82
	add	r1, r0, r3
	ldr	r3, .L134+12
	str	r1, [r5]
	add	ip, r3, #576
.L89:
	ldr	r1, [r3, #4]
	sub	r1, r1, r0
	str	r1, [r3, #4]
	add	r3, r3, #64
	cmp	r3, ip
	bne	.L89
	ldr	r3, .L134+16
	add	ip, r3, #660
.L91:
	ldr	r1, [r3, #32]
	cmp	r1, #1
	ldreq	r1, [r3, #4]
	subeq	r1, r1, r0
	streq	r1, [r3, #4]
	add	r3, r3, #44
	cmp	ip, r3
	bne	.L91
	b	.L82
.L104:
	ldr	r3, .L134+36
	smull	lr, r6, r2, r3
	rsb	r1, r1, r6, asr #3
	add	r1, r1, r1, lsl #2
	cmp	r2, r1, lsl #2
	bne	.L106
	b	.L105
.L130:
	ldrh	r3, [r1, #48]
	tst	r3, #2
	ldr	ip, [r4, #4]
	ldr	lr, [r4, #56]
	bne	.L128
	cmp	r0, #9
	ble	.L128
.L98:
	cmp	ip, #440
	ble	.L128
	ldr	r6, .L134+16
	mov	r3, #0
	mov	r1, r6
.L102:
	ldr	r0, [r1, #32]
	cmp	r0, #0
	beq	.L133
	add	r3, r3, #1
	cmp	r3, #15
	add	r1, r1, #44
	bne	.L102
.L101:
	mov	r0, #1
	b	.L97
.L132:
	mov	r7, #1
	str	r7, [r4, #52]
	bl	fireDrops
	ldr	lr, [r4, #56]
	cmp	lr, #0
	ldreq	r3, [r4, #28]
	subeq	r3, r3, #2
	str	r6, [r4, #20]
	movne	r0, r7
	moveq	r0, r7
	streq	r3, [r4, #28]
	ldr	r2, [r4, #44]
	b	.L95
.L133:
	mov	r1, #1
	mov	r8, #22
	mov	r7, #190
	add	r9, r3, r3, lsl #2
	add	r3, r3, r9, lsl r1
	lsl	r3, r3, #2
	str	r8, [r6, r3]
	add	r3, r6, r3
	str	r0, [r3, #36]
	str	r7, [r3, #4]
	str	r1, [r3, #32]
	b	.L101
.L135:
	.align	2
.L134:
	.word	67109120
	.word	player
	.word	hOff
	.word	flowers
	.word	drops
	.word	oldButtons
	.word	buttons
	.word	1374389535
	.word	vOff
	.word	1717986919
	.size	updatePlayer, .-updatePlayer
	.align	2
	.global	fireDropsFaucet
	.syntax unified
	.arm
	.fpu softvfp
	.type	fireDropsFaucet, %function
fireDropsFaucet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r0, .L146
	mov	r3, #0
	mov	r2, r0
	b	.L139
.L137:
	add	r3, r3, #1
	cmp	r3, #15
	add	r2, r2, #44
	bxeq	lr
.L139:
	ldr	r1, [r2, #32]
	cmp	r1, #0
	bne	.L137
	mov	r2, #1
	push	{r4, lr}
	mov	lr, #22
	mov	ip, #190
	add	r4, r3, r3, lsl #2
	add	r3, r3, r4, lsl r2
	lsl	r3, r3, #2
	str	lr, [r0, r3]
	add	r3, r0, r3
	str	r1, [r3, #36]
	str	ip, [r3, #4]
	str	r2, [r3, #32]
	pop	{r4, lr}
	bx	lr
.L147:
	.align	2
.L146:
	.word	drops
	.size	fireDropsFaucet, .-fireDropsFaucet
	.align	2
	.global	initFlowers
	.syntax unified
	.arm
	.fpu softvfp
	.type	initFlowers, %function
initFlowers:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #0
	push	{r4, r5, r6, r7, lr}
	mov	r0, #40
	mov	r2, r1
	mov	lr, #1
	mov	ip, #8
	mov	r7, #136
	mov	r6, #100
	mov	r5, #35
	mov	r4, #34
	ldr	r3, .L152
.L149:
	str	r1, [r3, #60]
	add	r1, r1, #1
	cmp	r1, #9
	stmib	r3, {r0, r2}
	str	lr, [r3, #36]
	str	ip, [r3, #12]
	str	ip, [r3, #16]
	str	r7, [r3]
	str	lr, [r3, #20]
	str	r6, [r3, #24]
	str	r5, [r3, #28]
	str	r4, [r3, #32]
	str	r2, [r3, #40]
	str	r2, [r3, #48]
	str	r2, [r3, #44]
	str	r2, [r3, #52]
	str	r2, [r3, #56]
	add	r0, r0, #35
	add	r3, r3, #64
	bne	.L149
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L153:
	.align	2
.L152:
	.word	flowers
	.size	initFlowers, .-initFlowers
	.align	2
	.global	initGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	initGame, %function
initGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r0, #0
	push	{r4, r5, r6, r7, r8, lr}
	mov	lr, #96
	mov	r4, r0
	ldr	r1, .L160
	ldr	r5, .L160+4
	ldr	ip, .L160+8
	str	r0, [r1]
	str	r0, [r5]
	mov	r3, #256
	ldr	r5, .L160+12
	ldr	r2, .L160+16
	ldr	r1, .L160+20
	mov	r0, #3
	str	lr, [ip]
	mov	lr, pc
	bx	r5
	ldr	r2, .L160+24
	ldr	r1, .L160+28
	mov	r0, #3
	mov	r3, #16384
	mov	lr, pc
	bx	r5
	ldr	r3, .L160+32
	mov	lr, pc
	bx	r3
	mov	r5, r4
	mov	r3, r4
	mov	ip, #8
	ldr	r2, .L160+36
	sub	r0, r2, #8
	sub	r1, r2, #4
.L155:
	add	r4, r4, #1
	cmp	r4, #50
	str	ip, [r2, r3]
	str	r4, [r0, r4, lsl #4]
	lsl	r3, r4, #4
	str	r5, [r1, r4, lsl #4]
	bne	.L155
	bl	initPlayer
	mov	r8, #30
	mov	lr, #16
	mov	r1, #1
	mov	r7, #70
	mov	r2, #81
	mov	r6, #0
	mov	r0, #8
	mov	ip, #2
	ldr	r3, .L160+40
	stm	r3, {r5, r8}
	str	r5, [r3, #24]
	str	r4, [r3, #28]
	str	r5, [r3, #48]
	str	r7, [r3, #52]
	str	lr, [r3, #12]
	str	lr, [r3, #8]
	str	lr, [r3, #36]
	str	lr, [r3, #32]
	str	lr, [r3, #60]
	str	lr, [r3, #56]
	str	r1, [r3, #20]
	str	r1, [r3, #16]
	str	r1, [r3, #44]
	str	r1, [r3, #40]
	str	r1, [r3, #68]
	str	r1, [r3, #64]
	ldr	r3, .L160+44
.L156:
	ldr	r1, [r3, #24]
	str	r2, [r3, #40]
	add	r2, r2, #1
	rsb	r1, r1, #0
	cmp	r2, #96
	str	r6, [r3, #4]
	str	r0, [r3, #28]
	str	ip, [r3, #16]
	str	r6, [r3, #20]
	str	r6, [r3, #32]
	str	r1, [r3]
	str	r0, [r3, #24]
	add	r3, r3, #44
	bne	.L156
	bl	initFlowers
	mov	r1, #1
	ldr	r3, .L160+48
	ldr	r0, .L160+52
	ldrh	ip, [r3, #48]
	ldr	r2, .L160+56
	ldr	r3, .L160+60
	strh	ip, [r0]	@ movhi
	str	r6, [r3]
	str	r1, [r2, #44]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L161:
	.align	2
.L160:
	.word	hOff
	.word	hOffClouds
	.word	vOff
	.word	DMANow
	.word	83886592
	.word	spritesheetPal
	.word	100728832
	.word	spritesheetTiles
	.word	hideSprites
	.word	tracker
	.word	lives
	.word	drops
	.word	67109120
	.word	buttons
	.word	flowers
	.word	frameCounter
	.size	initGame, .-initGame
	.align	2
	.global	drawFlowers
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawFlowers, %function
drawFlowers:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L176
	push	{r4, r5, r6, r7, lr}
	mov	ip, #512
	ldr	r2, .L176+4
	ldr	r4, .L176+8
	ldr	r5, .L176+12
	add	r0, r3, #576
	b	.L168
.L165:
	add	r3, r3, #64
	cmp	r3, r0
	add	r2, r2, #8
	beq	.L172
.L168:
	ldr	r1, [r3, #44]
	cmp	r1, #1
	strhne	ip, [r2, #40]	@ movhi
	bne	.L165
	ldr	r1, [r3, #36]
	cmp	r1, #1
	beq	.L173
	cmp	r1, #2
	beq	.L174
	cmp	r1, #3
	beq	.L175
	cmp	r1, #4
	bne	.L165
	ldr	r1, [r3, #48]
	add	lr, r1, r1, lsl #2
	add	r1, r1, lr, lsl #1
	ldr	r6, [r3, #8]
	ldr	lr, [r3, #4]
	add	r1, r1, #17
.L171:
	add	r1, r6, r1, lsl #3
	and	lr, lr, r4
	ldrb	r6, [r3]	@ zero_extendqisi2
	add	r3, r3, #64
	lsl	r1, r1, #2
	orr	lr, lr, r5
	cmp	r3, r0
	strh	r1, [r2, #44]	@ movhi
	strh	lr, [r2, #42]	@ movhi
	strh	r6, [r2, #40]	@ movhi
	add	r2, r2, #8
	bne	.L168
.L172:
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L173:
	ldr	r1, [r3, #48]
	add	lr, r1, r1, lsl #2
	add	r1, r1, lr, lsl #1
	ldr	lr, [r3, #8]
	add	r1, r1, #10
	ldr	r6, [r3, #4]
	add	r1, lr, r1, lsl #3
	ldrb	r7, [r3]	@ zero_extendqisi2
	lsl	r1, r1, #2
	and	lr, r6, r4
	strh	r1, [r2, #44]	@ movhi
	strh	lr, [r2, #42]	@ movhi
	strh	r7, [r2, #40]	@ movhi
	b	.L165
.L174:
	ldr	r1, [r3, #48]
	add	r1, r1, #1
	add	lr, r1, r1, lsl #2
	ldr	r6, [r3, #8]
	add	r1, r1, lr, lsl #1
	ldr	lr, [r3, #4]
	add	r1, r6, r1, lsl #3
	and	lr, lr, r4
	ldrb	r6, [r3]	@ zero_extendqisi2
	lsl	r1, r1, #2
	orr	lr, lr, #16384
	strh	r1, [r2, #44]	@ movhi
	strh	lr, [r2, #42]	@ movhi
	strh	r6, [r2, #40]	@ movhi
	b	.L165
.L175:
	ldr	r1, [r3, #48]
	add	lr, r1, r1, lsl #2
	add	r1, r1, lr, lsl #1
	ldr	r6, [r3, #8]
	ldr	lr, [r3, #4]
	add	r1, r1, #13
	b	.L171
.L177:
	.align	2
.L176:
	.word	flowers
	.word	shadowOAM
	.word	511
	.word	-32768
	.size	drawFlowers, .-drawFlowers
	.align	2
	.global	draw
	.syntax unified
	.arm
	.fpu softvfp
	.type	draw, %function
draw:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	bl	drawPlayer
	bl	drawLives
	mov	r3, #32768
	mov	r0, #49152
	mov	r2, #28
	ldr	r1, .L186
	strh	r3, [r1, #8]	@ movhi
	ldr	r3, .L186+4
	mov	r6, #512
	mov	r5, #2
	strh	r0, [r1, #10]	@ movhi
	strh	r2, [r1, #12]	@ movhi
	add	ip, r3, #660
	b	.L181
.L185:
	ldr	r2, [r3, #40]
	ldr	r4, [r3]
	ldr	lr, [r3, #4]
	lsl	r2, r2, #3
	add	r3, r3, #44
	add	r0, r1, r2
	cmp	r3, ip
	strh	r4, [r1, r2]	@ movhi
	strh	r5, [r0, #4]	@ movhi
	strh	lr, [r0, #2]	@ movhi
	beq	.L184
.L181:
	ldr	r2, [r3, #32]
	cmp	r2, #0
	bne	.L185
	ldr	r2, [r3, #36]
	cmp	r2, #0
	ldreq	r2, [r3, #40]
	add	r3, r3, #44
	lsleq	r2, r2, #3
	strheq	r6, [r1, r2]	@ movhi
	cmp	r3, ip
	bne	.L181
.L184:
	bl	drawFlowers
	mov	r2, #67108864
	ldr	r1, .L186+8
	ldr	r3, .L186+12
	ldr	r1, [r1]
	smull	r0, ip, r1, r3
	sub	r3, ip, r1, asr #31
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	strh	r3, [r2, #20]	@ movhi
	ldr	r3, .L186+16
	ldrh	r1, [r3]
	ldr	r3, .L186+20
	ldrh	r3, [r3]
	strh	r1, [r2, #16]	@ movhi
	pop	{r4, r5, r6, lr}
	strh	r3, [r2, #18]	@ movhi
	bx	lr
.L187:
	.align	2
.L186:
	.word	shadowOAM
	.word	drops
	.word	hOffClouds
	.word	1431655766
	.word	hOff
	.word	vOff
	.size	draw, .-draw
	.align	2
	.global	updateFlowers
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateFlowers, %function
updateFlowers:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r1, [r0, #56]
	ldr	r3, [r0, #44]
	add	r1, r1, #1
	cmp	r3, #1
	str	r1, [r0, #56]
	bxne	lr
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r4, .L216
	mov	ip, #0
	mov	r3, r4
	add	lr, r4, #576
.L192:
	ldr	r2, [r3, #44]
	add	r3, r3, #64
	cmp	r2, #0
	addne	ip, ip, #1
	cmp	lr, r3
	bne	.L192
	cmp	ip, #1
	moveq	r3, #0
	streq	r3, [r0, #52]
	ldr	r3, .L216+4
	smull	ip, r2, r3, r1
	asr	r3, r1, #31
	rsb	r3, r3, r2, asr #3
	add	r3, r3, r3, lsl #2
	ldr	r2, [r0, #28]
	subs	r1, r1, r3, lsl #2
	str	r2, [r0, #32]
	movne	ip, r2
	bne	.L194
	ldr	ip, [r0, #8]
	ldr	r3, .L216+8
	add	ip, ip, #1
	smull	lr, r5, ip, r3
	sub	r3, r5, ip, asr #31
	add	r3, r3, r3, lsl #1
	sub	r3, ip, r3
	ldr	ip, [r0, #20]
	sub	ip, r2, ip
	str	r1, [r0, #56]
	str	r3, [r0, #8]
	str	ip, [r0, #28]
.L194:
	cmp	ip, #20
	mov	r5, r0
	bgt	.L195
	cmp	r2, #20
	bgt	.L213
.L196:
	cmp	r2, #0
	ble	.L214
.L188:
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L195:
	mov	r3, #0
	add	r1, r0, #24
	ldmda	r1, {r1, r2}
	sub	r2, r2, r1
	cmp	r2, ip
	str	r3, [r0, #48]
	bgt	.L188
	ldr	r3, [r0, #36]
	cmp	r3, #3
	bgt	.L198
	add	r3, r3, #1
	cmp	r3, #2
	str	r3, [r0, #36]
	beq	.L215
	cmp	r3, #3
	bne	.L200
	mov	r0, #32
	ldr	r1, [r5, #4]
	ldr	r2, [r5]
	sub	r1, r1, #8
	sub	r2, r2, #16
	str	r1, [r5, #4]
	str	r2, [r5]
	str	r0, [r5, #12]
	str	r0, [r5, #16]
.L200:
	mov	r2, #30
	str	r2, [r5, #28]
.L198:
	cmp	r3, #4
	bne	.L188
	ldr	r6, [r5, #52]
	cmp	r6, #0
	bne	.L188
	mov	r2, #1
	mov	r3, r6
	str	r2, [r5, #52]
	ldr	r1, .L216+12
	ldr	r2, .L216+16
	ldr	r0, .L216+20
	ldr	r5, .L216+24
	mov	lr, pc
	bx	r5
	ldr	r2, .L216+28
	b	.L202
.L201:
	cmp	r6, #9
	beq	.L188
.L202:
	ldr	r3, [r2, r6, lsl #6]
	cmp	r3, #0
	lsl	r3, r6, #6
	add	r6, r6, #1
	bne	.L201
	mov	r0, #1
	ldr	r1, .L216+32
	ldr	r2, [r1]
	add	r4, r4, r3
	add	r3, r2, r0
	str	r0, [r4, #44]
	str	r3, [r1]
	b	.L188
.L213:
	mov	r2, #1
	mov	r3, #0
	str	r2, [r0, #48]
	str	r3, [r0, #52]
	ldr	r2, .L216+16
	ldr	r1, .L216+36
	ldr	r0, .L216+40
	ldr	r4, .L216+24
	mov	lr, pc
	bx	r4
	ldr	r2, [r5, #32]
	b	.L196
.L214:
	mov	r8, #136
	mov	ip, #1
	mov	r3, #0
	mov	r0, #8
	mov	r6, #100
	mov	r4, #35
	mov	lr, #34
	ldr	r2, [r5, #60]
	ldr	r1, .L216+44
	add	r2, r2, r2, lsl #2
	ldr	r1, [r1]
	ldr	r7, .L216+48
	rsb	r2, r2, r2, lsl #3
	add	r2, r2, #40
	sub	r2, r2, r1
	ldr	r1, [r7]
	str	r8, [r5]
	ldr	r8, .L216+32
	str	ip, [r5, #36]
	str	ip, [r5, #20]
	ldr	ip, [r8]
	sub	r1, r1, #1
	str	r2, [r5, #4]
	str	r0, [r5, #12]
	str	r0, [r5, #16]
	str	r4, [r5, #28]
	sub	ip, ip, #1
	str	r1, [r7]
	str	r3, [r5, #8]
	str	r3, [r5, #40]
	str	r3, [r5, #48]
	str	r3, [r5, #44]
	str	r3, [r5, #52]
	str	r3, [r5, #56]
	str	r6, [r5, #24]
	str	lr, [r5, #32]
	ldr	r2, .L216+16
	ldr	r1, .L216+52
	ldr	r0, .L216+56
	ldr	r4, .L216+24
	str	ip, [r8]
	mov	lr, pc
	bx	r4
	b	.L188
.L215:
	mov	r0, #16
	ldr	r1, [r5, #4]
	ldr	r2, [r5]
	sub	r1, r1, #4
	sub	r2, r2, #8
	str	r1, [r5, #4]
	str	r2, [r5]
	str	r0, [r5, #12]
	str	r0, [r5, #16]
	b	.L200
.L217:
	.align	2
.L216:
	.word	flowers
	.word	1717986919
	.word	1431655766
	.word	24801
	.word	11025
	.word	sparkle_c2
	.word	playSoundB
	.word	flowers+44
	.word	flowersAlive
	.word	17770
	.word	wilt_c2
	.word	hOff
	.word	livesRemaining
	.word	28307
	.word	dead_c2
	.size	updateFlowers, .-updateFlowers
	.align	2
	.global	growNewFlower
	.syntax unified
	.arm
	.fpu softvfp
	.type	growNewFlower, %function
growNewFlower:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #0
	ldr	r1, .L223
	b	.L221
.L219:
	cmp	r3, #9
	bxeq	lr
.L221:
	ldr	r2, [r1, r3, lsl #6]
	cmp	r2, #0
	lsl	r2, r3, #6
	add	r3, r3, #1
	bne	.L219
	mov	ip, #1
	ldr	r0, .L223+4
	ldr	r3, .L223+8
	ldr	r1, [r0]
	add	r2, r3, r2
	add	r3, r1, ip
	str	r3, [r0]
	str	ip, [r2, #44]
	bx	lr
.L224:
	.align	2
.L223:
	.word	flowers+44
	.word	flowersAlive
	.word	flowers
	.size	growNewFlower, .-growNewFlower
	.align	2
	.global	countFlowers
	.syntax unified
	.arm
	.fpu softvfp
	.type	countFlowers, %function
countFlowers:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r0, #0
	ldr	r3, .L233
	add	r1, r3, #576
.L227:
	ldr	r2, [r3, #44]
	add	r3, r3, #64
	cmp	r2, #0
	addne	r0, r0, #1
	cmp	r3, r1
	bne	.L227
	bx	lr
.L234:
	.align	2
.L233:
	.word	flowers
	.size	countFlowers, .-countFlowers
	.align	2
	.global	allGrown
	.syntax unified
	.arm
	.fpu softvfp
	.type	allGrown, %function
allGrown:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r0, #0
	ldr	r3, .L239
	add	r1, r3, #576
.L237:
	ldr	r2, [r3, #52]
	add	r3, r3, #64
	cmp	r2, #1
	addeq	r0, r0, #1
	cmp	r3, r1
	bne	.L237
	sub	r3, r0, #9
	rsbs	r0, r3, #0
	adc	r0, r0, r3
	bx	lr
.L240:
	.align	2
.L239:
	.word	flowers
	.size	allGrown, .-allGrown
	.align	2
	.global	deadFlower
	.syntax unified
	.arm
	.fpu softvfp
	.type	deadFlower, %function
deadFlower:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r1, .L252
	mov	r3, #0
	add	ip, r1, #8
	b	.L244
.L242:
	add	r3, r3, #1
	cmp	r3, #9
	bxeq	lr
.L244:
	ldr	r2, [r1, r3, lsl #6]
	cmp	r2, #0
	lsl	r2, r3, #6
	beq	.L242
	ldr	r0, [ip, r3, lsl #6]
	cmp	r0, #0
	beq	.L242
	mov	r1, #0
	ldr	r3, .L252+4
	add	r2, r3, r2
	str	r1, [r2, #52]
	bx	lr
.L253:
	.align	2
.L252:
	.word	flowers+44
	.word	flowers
	.size	deadFlower, .-deadFlower
	.align	2
	.global	clearFlowerHistory
	.syntax unified
	.arm
	.fpu softvfp
	.type	clearFlowerHistory, %function
clearFlowerHistory:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	mov	r2, #0
	mov	r6, #136
	mov	r5, #100
	mov	r4, #35
	mov	lr, #34
	mov	ip, #1
	mov	r1, #8
	ldr	r3, [r0, #60]
	ldr	r7, .L256
	add	r3, r3, r3, lsl #2
	ldr	r7, [r7]
	rsb	r3, r3, r3, lsl #3
	add	r3, r3, #40
	sub	r3, r3, r7
	str	r6, [r0]
	str	r5, [r0, #24]
	str	r4, [r0, #28]
	str	lr, [r0, #32]
	str	r3, [r0, #4]
	str	r2, [r0, #8]
	str	r2, [r0, #40]
	str	r2, [r0, #48]
	str	r2, [r0, #44]
	str	r2, [r0, #52]
	str	r2, [r0, #56]
	str	ip, [r0, #36]
	str	ip, [r0, #20]
	str	r1, [r0, #12]
	str	r1, [r0, #16]
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L257:
	.align	2
.L256:
	.word	hOff
	.size	clearFlowerHistory, .-clearFlowerHistory
	.align	2
	.global	collision
	.syntax unified
	.arm
	.fpu softvfp
	.type	collision, %function
collision:
	@ Function supports interworking.
	@ args = 12, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	ip, [sp, #8]
	cmp	ip, #16
	add	r2, r0, r2
	ldr	r0, [sp]
	ble	.L265
	cmp	r0, r2
	bge	.L264
	ldr	r2, [sp, #4]
	add	r2, r2, ip, asr #2
	cmp	r2, r1
	bgt	.L264
	cmp	ip, #0
	add	r0, ip, #3
	movge	r0, ip
	ldr	r2, [sp, #4]
	add	r3, r3, r3, lsr #31
	add	ip, ip, r2
	sub	ip, ip, r0, asr #2
	add	r1, r1, r3, asr #1
	cmp	r1, ip
	movgt	r0, #0
	movle	r0, #1
	bx	lr
.L265:
	cmp	r0, r2
	blt	.L266
.L264:
	mov	r0, #0
	bx	lr
.L266:
	ldr	r2, [sp, #4]
	sub	r2, r2, #5
	cmp	r1, r2
	blt	.L264
	ldr	r2, [sp, #4]
	add	r3, r3, r3, lsr #31
	add	ip, ip, r2
	add	r3, r1, r3, asr #1
	add	ip, ip, #5
	cmp	r3, ip
	movgt	r0, #0
	movle	r0, #1
	bx	lr
	.size	collision, .-collision
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateDrops.part.3, %function
updateDrops.part.3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r6, [r0]
	ldr	r7, [r0, #24]
	add	r9, r6, r7
	cmp	r9, #0
	sub	sp, sp, #28
	ble	.L268
	ldr	r8, [r0, #16]
	add	r8, r6, r8
	sub	r3, r8, #1
	cmp	r3, #157
	bls	.L286
.L268:
	mov	r3, #0
	str	r3, [r0, #32]
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L286:
	ldr	r3, [r0, #28]
	str	r8, [sp, #16]
	mov	r5, r0
	mov	r8, r3
	ldr	r4, .L287
	ldr	fp, [r0, #4]
	str	r3, [sp, #20]
	add	r10, r4, #576
.L270:
	ldr	r3, [r4, #44]
	cmp	r3, #0
	beq	.L269
	ldr	r1, [r4, #12]
	ldr	r2, [r4, #4]
	ldr	r3, [r4]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	mov	r2, r7
	mov	r3, r8
	mov	r1, fp
	mov	r0, r6
	bl	collision
	cmp	r0, #0
	beq	.L269
	ldr	r3, [r4, #28]
	add	r2, r3, #15
	str	r3, [r4, #32]
	mov	r3, #0
	str	r2, [r4, #28]
	str	r3, [r5, #32]
.L269:
	add	r4, r4, #64
	cmp	r4, r10
	bne	.L270
	ldr	r2, .L287+4
	ldr	r0, [r2, #36]
	add	r3, r0, #5
	cmp	r9, r3
	ldr	r8, [sp, #16]
	ble	.L271
	ldr	r1, [r2, #40]
	add	r3, r1, #7
	cmp	r3, fp
	bge	.L271
	ldr	ip, [r2, #12]
	ldr	r3, [sp, #20]
	add	r1, r1, ip
	add	r3, r3, r3, lsr #31
	add	ip, fp, r3, asr #1
	sub	r1, r1, #7
	cmp	r1, ip
	movle	r3, #0
	movgt	r3, #1
	cmp	r6, r0
	movge	r3, #0
	cmp	r3, #0
	beq	.L271
	add	r1, r2, #24
	ldm	r1, {r1, r3}
	sub	r0, r1, #9
	cmp	r0, r3
	addgt	r3, r3, #10
	strgt	r3, [r2, #28]
	bgt	.L273
	cmp	r1, r3
	strgt	r1, [r2, #28]
.L273:
	mov	r3, #0
	str	r3, [r5, #32]
.L271:
	ldr	r3, [r5, #20]
	add	fp, r3, fp
	stm	r5, {r8, fp}
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L288:
	.align	2
.L287:
	.word	flowers
	.word	player
	.size	updateDrops.part.3, .-updateDrops.part.3
	.align	2
	.global	updateDrops
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateDrops, %function
updateDrops:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #32]
	cmp	r3, #0
	bxeq	lr
	b	updateDrops.part.3
	.size	updateDrops, .-updateDrops
	.align	2
	.global	updateGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateGame, %function
updateGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r0, .L312
	ldr	r1, .L312+4
	ldr	r2, [r0]
	ldr	r3, [r1]
	push	{r4, r5, r6, r7, r8, lr}
	add	r3, r3, #1
	add	r2, r2, #1
	str	r3, [r1]
	str	r2, [r0]
	bl	updatePlayer
	ldr	r3, .L312+8
	ldr	r3, [r3]
	cmp	r3, #2
	beq	.L311
	cmp	r3, #1
	moveq	r2, #0
	ldreq	r3, .L312+12
	streq	r2, [r3, #44]
	beq	.L293
.L294:
	cmp	r3, #0
	ldreq	r2, .L312+12
	streq	r3, [r2, #20]
.L293:
	ldr	r4, .L312+16
	add	r5, r4, #660
.L296:
	ldr	r3, [r4, #32]
	cmp	r3, #0
	movne	r0, r4
	blne	updateDrops.part.3
.L295:
	add	r4, r4, #44
	cmp	r4, r5
	bne	.L296
	ldr	r6, .L312+20
	mov	r8, #1
	mov	r7, r6
	mov	r5, r6
	add	r4, r6, #576
.L297:
	mov	r3, r6
	mov	r1, #0
.L299:
	ldr	r2, [r3, #44]
	add	r3, r3, #64
	cmp	r2, #0
	addne	r1, r1, #1
	cmp	r4, r3
	bne	.L299
	cmp	r1, #0
	streq	r8, [r7, #44]
	mov	r0, r5
	add	r5, r5, #64
	bl	updateFlowers
	cmp	r4, r5
	bne	.L297
	pop	{r4, r5, r6, r7, r8, lr}
	b	updateWaterTracker
.L311:
	mov	r2, #0
	ldr	r3, .L312+12
	str	r2, [r3, #68]
	b	.L293
.L313:
	.align	2
.L312:
	.word	frameCounter
	.word	hOffClouds
	.word	livesRemaining
	.word	lives
	.word	drops
	.word	flowers
	.size	updateGame, .-updateGame
	.align	2
	.global	caught
	.syntax unified
	.arm
	.fpu softvfp
	.type	caught, %function
caught:
	@ Function supports interworking.
	@ args = 12, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	ldr	ip, [sp, #4]
	add	r2, r0, r2
	add	lr, ip, #5
	cmp	r2, lr
	ble	.L317
	ldr	r2, [sp, #8]
	add	r2, r2, #7
	cmp	r2, r1
	blt	.L319
.L317:
	mov	r3, #0
	ldr	lr, [sp], #4
	mov	r0, r3
	bx	lr
.L319:
	add	r2, sp, #8
	ldm	r2, {r2, lr}
	add	r3, r3, r3, lsr #31
	add	r2, r2, lr
	add	r1, r1, r3, asr #1
	sub	r2, r2, #7
	cmp	r2, r1
	movle	r3, #0
	movgt	r3, #1
	cmp	r0, ip
	movge	r3, #0
	ldr	lr, [sp], #4
	mov	r0, r3
	bx	lr
	.size	caught, .-caught
	.comm	playerDisplacement,4,4
	.comm	hOffClouds,4,4
	.comm	hOff,4,4
	.comm	vOff,4,4
	.comm	frameCounter,4,4
	.comm	shadowOAM,1024,4
	.comm	tracker,800,4
	.comm	flowers,576,4
	.comm	drops,660,4
	.comm	lives,72,4
	.comm	player,60,4
	.comm	soundB,32,4
	.comm	soundA,32,4
	.ident	"GCC: (devkitARM release 50) 8.2.0"
