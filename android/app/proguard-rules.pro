# Keep Stripe push provisioning and all related classes
-keep class com.stripe.** { *; }
-dontwarn com.stripe.**

# Prevent R8 from removing Stripe-related classes used via reflection or intent
-keep class com.reactnativestripesdk.** { *; }
-dontwarn com.reactnativestripesdk.**