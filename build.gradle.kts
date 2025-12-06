plugins {
    kotlin("multiplatform") version "2.0.0" apply false
    id("com.android.application") version "8.2.2" apply false
    id("com.android.library") version "8.2.2" apply false
    id("org.jetbrains.compose") version "1.6.11" apply false
}

allprojects {
    group = "com.template.app"
    version = "1.0.0"
}
