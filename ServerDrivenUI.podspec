Pod::Spec.new do |s|
  s.name         = "ServerDrivenUI"
  s.version      = "0.0.1"
  s.summary      = "ServerDrivenUI"

  s.description  = <<-DESC
ServerDrivenUI enables dynamic UI creation from JSON configuration.

- ServerDrivenUI.
DESC

  s.ios.deployment_target  = '15.0'
  s.homepage      = "https://github.com/sheikharshad/ServerDrivenUI"
  s.license       = "MIT"
  s.author        = { "Arshad" => "sheikharshad@gmail.com" }
  s.source        = { :git =>  'https://github.com/sheikharshad/ServerDrivenUI.git'}
  s.source_files  = "ServerDrivenUI/**/*.swift"
  s.exclude_files = "Classes/Exclude"
  

  s.static_framework = true
  s.framework    = "SwiftUI"
  s.requires_arc = true
   
   # Add this line
  s.pod_target_xcconfig = {
    'ENABLE_USER_SCRIPT_SANDBOXING' => 'NO',
    'BUILD_LIBRARY_FOR_DISTRIBUTION' => 'YES'
  }
end
