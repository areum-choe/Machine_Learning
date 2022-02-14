import numpy as np
import pandas as pd

from sklearn.ensemble import RandomForestClassifier
from sklearn.model_selection import train_test_split, GridSearchCV
import CommonLib.Common as common
from sklearn.metrics import accuracy_score # 정확도 함수
import CommonLib.Performance.PerformanceManager as pfm

def randomforest_run(request_json):
    try:

        n_estimators = 5
        max_depth = 5
        random_state = 0

        if __name__ == "__main__":
            df = pd.read_csv(common.get_local_file_path() + '로지스틱.csv')
            df['sex'] = df['sex'].map({'F': 0, 'M': 1})
        else:
            df = pd.DataFrame(request_json)

        # df = df.dropna(axis=0)
        # df = df.astype('float')

        print(df.head(10))
        if 'n_estimators' in df.columns:
            df_params = df.loc[:, ['n_estimators','max_depth','random_state']]
            df_params = df_params.dropna()
            n_estimators = df_params['n_estimators'].values[0].astype('int')
            max_depth = df_params['max_depth'].values[0].astype('int')
            random_state = df_params['random_state'].values[0].astype('int')
            df = df.drop(['n_estimators', 'max_depth', 'random_state'], axis=1)
        else:
            df = df

        df = df.dropna(axis=0)
        x = df.iloc[:, 1:]
        y = df.iloc[:, [0]]
        y = y.astype('int')

        train_x, test_x, train_y, test_y = train_test_split(x, y, test_size = 0.2, random_state=42)

        clf = RandomForestClassifier(n_estimators=n_estimators, max_depth=max_depth, random_state=random_state)
        clf.fit(train_x, train_y)

        pred_y = clf.predict(test_x)
        acc = accuracy_score(test_y, pred_y)
        print(n_estimators)
        print(acc)


        rf= RandomForestClassifier(random_state=1)
        param_grid = [{'n_esimators':range(5,50,10), 'max_features':range(1,4), 'max_depth':range(3,5)}]
        gs = GridSearchCV(estimator=rf, param_grid=param_grid, scoring='accuracy', cv=5, n_jobs=-1)
        gs.fit(train_x, train_y)
        print(gs.best_params_)
        print(gs.best_score_)
        return acc

    except Exception as err:
        common.exception_print(err)


if __name__ == "__main__":
    randomforest_run(None)