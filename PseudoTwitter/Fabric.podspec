Pod::Spec.new do |spec|
  spec.name         = "Fabric"
  spec.version      = "1.3.0"
  spec.summary      = "Fabric by Twitter, Inc."
  spec.homepage     = "https://fabric.io"
  spec.author       = "Twitter"
  spec.license      = { :type => "Copyright", :file => "LICENSE.md" } # from http://fabric.io/terms
  spec.platform     = :ios, "5.0"
  spec.source       = { :git => "https://github.com/zergtmn/Fabric.git", :tag => "v#{spec.version}" }
  spec.requires_arc = true
  spec.default_subspec = "Core"

  spec.subspec "Core" do |core|
    core.vendored_frameworks = "Fabric.framework"
    core.public_header_files = "Fabric.framework/Headers/*.h"
  end

  spec.subspec "Crashlytics" do |crashlytics|
    crashlytics.vendored_frameworks = "Crashlytics.framework"
    crashlytics.public_header_files = "Crashlytics.framework/Headers/*.h"
  end

  spec.subspec "MoPub" do |mopub|
    mopub.vendored_frameworks = "MoPub.framework"
    mopub.resource_bundles = { "MoPub" => "MoPub.framework/Versions/A/Resources/MoPub.bundle/*" }
  end

  spec.subspec "Twitter" do |twitter|
    twitter.vendored_frameworks = "TwitterCore.framework", "TwitterKit.framework", "DigitsKit.framework"
    twitter.resource_bundles = {
      "TwitterKitResources" => "TwitterKit.framework/Versions/A/Resources/TwitterKitResources.bundle/*",
      "DigitsKitResources" => "DigitsKit.framework/Versions/A/Resources/DigitsKitResources.bundle/*"
    }
  end
end
