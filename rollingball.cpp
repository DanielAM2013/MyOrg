#include <iostream>

using namespace std;

enum prox {
	STOP = 0,
	LEFT = -1,
	RIGHT = -2,
	UP = -3,
	DOWN = -4,
};

typedef struct pose_t {
	int i;
	int j;
	pose_t () {}
	pose_t ( int y, int x) {
		i=y;
		j=x;
	}

	void operator=(pose_t px) {
		i = px.i;
		j = px.j;
	}

	int test(int y, int x, int m, int* vec) {
		if ( i+y == m || i+y == -1 || j+x == m || j+x == -1 )
			return vec[i*m+j];
		return vec[(i+y)*m+(j+x)];
	}

	void set(int y, int x) {
		i=y;
		j=x;
	}

	void add(int y, int x) {
		i+=y;
		j+=x;
	}
} pose_t;


prox menor_vizinho(int m, pose_t p, int *vec) {
	
	// melhor caso
	if ( p.test(0,-1,m,vec) < p.test(0,0,m,vec) )
		return LEFT;
	else
	if ( p.test(0,1,m,vec) < p.test(0,0,m,vec) )
		return RIGHT;
	else
	if ( p.test(1,0,m,vec) < p.test(0,0,m,vec) )
		return UP;
	else
	if ( p.test(-1,0,m,vec) < p.test(0,0,m,vec) )
		return DOWN;
	else
		return STOP;
}

pose_t step(pose_t p, prox act) {
	pose_t tmp(p.i,p.j);
	switch (act) {
		case (LEFT):
			tmp.add(p.i, p.j-1);
			return tmp;
		case (RIGHT):
			tmp.add(p.i, p.j+1);
			return tmp;
		case (UP):
			tmp.add(p.i+1, p.j);
			return tmp;
		case (DOWN):
			tmp.add(p.i-1, p.j);
			return tmp;
		case (STOP):
			tmp.add(p.i, p.j);
			return tmp;
	}
}

void achar_menor( int m, pose_t p, prox *nxt, int *val) {

	// dado um ponto de inicio deve seguir até o menor
	pose_t px;
	px = p;
	int deep=0;
	while ( nxt[px.i*m+px.j] != STOP && val[px.i*m+px.j] == -1 ) {
		px = step(px, nxt[px.i*m+px.j]);
		deep++;
	}

	px = p;
	while ( nxt[px.i*m+px.j] != STOP && val[px.i*m+px.j] == -1 ) {
		px = step(px, nxt[px.i*m+px.j]);
		val[px.i*m+px.j]=deep--;
	}

	if ( nxt[px.i*m+px.j] == STOP ) {
		val[px.i*m+px.j]=0;
	}
}

void rollingball( int m, int *vec) {
	// ler primeiro e identificar o vizinho mais proximo
	prox nxt[m][m];
	for ( int i=0; i<m; i++) {
		for ( int j=0; j<m; j++) {
			pose_t p(i,j);
			nxt[i][j] = menor_vizinho(m, p, vec);
		}
	}

	int val[m][m];
	// setup val
	for ( int i=0; i<m; i++) {
		for ( int j=0; j<m; j++) {
			val[i][j]=-1;
		}
	}

	for ( int i=0; i<m; i++) {
		for ( int j=0; j<m; j++) {
			pose_t p(i,j);
			achar_menor( m, p, (prox*) nxt, (int*) val);
		}
	}

	// seguir o caminho até encontrar o menor
	// deve atualizar os valores do caminho
	// caso o caminho ja esteja marcado deve atualizar
	//
}


int main () {

	int n;
	cin >> n;
	for ( int i=0; i<n; i++) {
		int m;
		cin >> m;
		int vec[m][m];
		for ( int j=0; j<m; j++) {
			for ( int k=0; k<m; k++) {
				cin >> vec[j][k];
			}
		}
		// matriz armazenada
		rollingball(m, (int*) vec);
	}

	return 0;

}
