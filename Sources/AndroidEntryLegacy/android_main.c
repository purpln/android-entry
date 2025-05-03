#include "android_main.h"

struct android_app* application;

extern int main(int argc, char **arg);

void android_main(struct android_app* app) {
    application = app;
    
    main(0, NULL);
}
