objects = main.o qte5.o

a.out: $(objects)
	gdc $^ -o $@

#doesn't work because of mixins
#%.di: %.d
#	gdc -fsyntax-only -fintfc $^ -o /dev/null

#main.o: main.d qte5.di
main.o: main.d
	gdc -c main.d -o $@

%.o: %.d
	gdc -c $^ -o $@

clean:
	$(RM) $(objects) a.out
