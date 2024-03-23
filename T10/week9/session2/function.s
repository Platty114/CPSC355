

	.text
	.balign 4
	.global assemblyFunction

assemblyFunction:
	stp x29, x30, [sp, -16]!
	mov x29, sp


	add x0, x0, 1

	ldp x29, x30, [sp], 16
	ret
