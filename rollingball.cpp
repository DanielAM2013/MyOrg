#include <iostream>

using namespace std;

enum prox {
	STOP = 0,
	LEFT = 1,
	RIGHT = 2,
	UP = 3,
	DOWN = 4,
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



void printm(int m, int *vec) {
	for ( int i=0; i<m; i++) {
		for ( int j=0; j<m; j++)
			cout << vec[i*m+j] << " ";
		cout << endl;
	}
}

prox menor_vizinho(int m, pose_t p, int *vec) {
	
	int min[5]={p.test(0,0,m,vec),
		p.test(0,-1,m,vec),
		p.test(0,1,m,vec),
		p.test(-1,0,m,vec),
		p.test(1,0,m,vec)
	};

	int tmp=min[0], idx=0;

	for (int i=1; i<5; i++) {
		if ( min[i] < tmp ) {
			idx=i;
			tmp=min[i];
		}
	}

	// melhor caso
	switch (idx) {
		case (0):
			return STOP;
		case (1):
			return LEFT;
		case (2):
			return RIGHT;
		case (3):
			return UP;
		case (4):
			return DOWN;
	}
}

pose_t step(pose_t p, prox act) {
	pose_t tmp(p.i,p.j);
	switch (act) {
		case (LEFT):
			tmp.add(0, -1);
			break;
		case (RIGHT):
			tmp.add(0, +1);
			break;
		case (UP):
			tmp.add(-1, 0);
			break;
		case (DOWN):
			tmp.add(+1, 0);
			break;
		case (STOP):
			break;
	}

	return tmp;
}

void achar_menor( int m, pose_t p, prox *nxt, int *val) {

	// dado um ponto de inicio deve seguir até o menor
	pose_t px;
	px = p;
	int deep=0;
	if ( nxt[px.i*m+px.j] == STOP ) {
		val[px.i*m+px.j]=0;
		return;
	}
	while ( nxt[px.i*m+px.j] != STOP ) {
		if ( val[px.i*m+px.j] != -1 ) {
			deep+=val[px.i*m+px.j];
			break;
		}
		px = step(px, nxt[px.i*m+px.j]);
		deep++;
	}
	cout << deep << endl;
	px = p;
	while ( nxt[px.i*m+px.j] != STOP && val[px.i*m+px.j] == -1 ) {
		val[px.i*m+px.j]=deep--;
		px = step(px, nxt[px.i*m+px.j]);
	}
	cout << deep << endl;

}

void rollingball( int m, int *vec) {
	// ler primeiro e identificar o vizinho mais proximo
	cout << "Iniciando rollingball" << endl;
	prox nxt[m][m];
	for ( int i=0; i<m; i++) {
		for ( int j=0; j<m; j++) {
			pose_t p(i,j);
			cout << "Menor vizinho em " << p.i << " "<< p.j << endl;
			nxt[i][j] = menor_vizinho(m, p, vec);
			cout << "Achou menor vizinho" << endl;
		}
	}
	printm(m, (int*) nxt);

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
			cout << "Procurar menor " << p.i << " " << p.j << endl;
			achar_menor( m, p, (prox*) nxt, (int*) val);
			cout << "Achou menor " << p.i << " " << p.j << endl;
		}
	}
	printm(m, (int*) val);

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
		printm(m, (int*) vec);
	}

	return 0;

}
