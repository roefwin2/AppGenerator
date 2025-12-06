plugins {
    kotlin("multiplatform")
    id("com.android.library")
    id("org.jetbrains.compose")
}

kotlin {
    androidTarget()

    iosX64()
    iosArm64()
    iosSimulatorArm64()

    cocoapods {
        summary = "Compose Multiplatform template shared module"
        homepage = "https://example.com"
        ios.deploymentTarget = "14.1"
        framework {
            baseName = "Shared"
            isStatic = false
        }
    }

    sourceSets {
        val commonMain by getting {
            dependencies {
                implementation(compose.runtime)
                implementation(compose.foundation)
                implementation(compose.material3)
                implementation(compose.ui)
            }
        }
        val commonTest by getting

        val androidMain by getting {
            dependencies {
                implementation("androidx.appcompat:appcompat:1.6.1")
            }
        }
        val iosX64Main by getting
        val iosArm64Main by getting
        val iosSimulatorArm64Main by getting
        val iosMain by creating {
            dependsOn(commonMain)
            iosX64Main.dependsOn(this)
            iosArm64Main.dependsOn(this)
            iosSimulatorArm64Main.dependsOn(this)
        }
    }
}

android {
    namespace = "com.template.shared"
    compileSdk = 34
    defaultConfig {
        minSdk = 24
    }
    sourceSets["main"].manifest.srcFile("src/androidMain/AndroidManifest.xml")
    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }
}
