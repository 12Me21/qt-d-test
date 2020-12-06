objects = main.o qte5.o derelict.o

a.out: $(objects) 
	gdc $^ -o $@

run: a.out liblua.so.5.3 libQtE5Widgets64.so
	@LD_LIBRARY_PATH=`pwd` ./a.out

#doesn't work because of mixins
%.di: %.d
	gdc -fsyntax-only -fintfc $^ -fintfc-file=$@

#main.o: main.d qte5.di derelict/lua/lua.di
main.o: main.d derelict/lua/lua.di
	gdc -c main.d -o $@

%.o: %.d
	gdc -c $^ -o $@

#######################
### derelicma balls ###
#######################

derelict.o: derelict/*/*.d
	gdc -c $^ -o $@

# must be called ONCE, manually
# todo: improve this
depends:
	rm -rf derelict/
	mkdir -p derelict/
	git clone https://github.com/DerelictOrg/DerelictUtil derelict/DerelictUtil --depth=1
	ln -s DerelictUtil/source/derelict/util/ derelict/util
	git clone https://github.com/DerelictOrg/DerelictLua derelict/DerelictLua --depth=1
	ln -s DerelictLua/source/derelict/lua/ derelict/lua
#git clone https://github.com/MGWL/QtE5 --depth=1

# idiots used the wrong name for the shared library
# it's liblua5.3.so, not liblua.so.5.3
liblua.so.5.3: /usr/lib/x86_64-linux-gnu/liblua5.3.so
	ln -s -f $^ $@

########################

clean:
	$(RM) $(objects) a.out
	$(RM) -r derelict/
	unlink liblua.so.5.3 2>/dev/null || true
