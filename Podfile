# Uncomment the next line to define a global platform for your project
platform :ios, '13.0'

plugin 'cocoapods-keys', {
  :project => "Eidolon",
  :keys => [
    "GraphQLBaseURL"
  ]
}

target 'Bobot' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  pod 'GoogleSignIn'
  pod 'R.swift'
  pod 'Firebase/Analytics'
  pod 'Apollo'
  pod 'SwiftLint'

  # Pods for Bobot

  target 'BobotTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'BobotUITests' do
    # Pods for testing
  end

end
