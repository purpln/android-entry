#include "android_main.h"

struct android_app *app_state;

extern int main(int argc, char **arg);

void android_main(struct android_app* app) {
    app_state = app;
    
    main(0, NULL);
}
