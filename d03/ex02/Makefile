CIPHER = cipher.native
UNCIPHER = uncipher.native
LIB =

all:
	ocamlbuild $(LIB) $(CIPHER)
	ocamlbuild $(LIB) $(UNCIPHER)

cipher:
	ocamlbuild $(LIB) $(CIPHER)

uncipher:
	ocamlbuild $(LIB) $(UNCIPHER)

clean:
	rm -rf _build $(CIPHER) $(UNCIPHER)
