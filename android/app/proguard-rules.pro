# Keep gRPC internal classes used by Google Places SDK
-keep class io.grpc.** { *; }
-dontwarn io.grpc.**

# Keep Google internal Places SDK classes
-keep class com.google.android.libraries.places.** { *; }
-dontwarn com.google.android.libraries.places.**
