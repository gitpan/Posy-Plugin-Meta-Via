use 5.008001;
use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile(
    NAME              => 'Posy::Plugin::Meta::Via',
    VERSION_FROM      => 'lib/Posy/Plugin/Meta/Via.pm', 
    PREREQ_PM         => {
                          Posy                => 0.92,
                          Posy::Core          => 0.92,
                          Posy::Plugin::Meta  => 0.1,
                          Test::More          => 0
                         }, 
    ($] >= 5.005 ?     ## Add these new keywords supported since 5.005
      (ABSTRACT_FROM  => 'lib/Posy/Plugin/Meta/Via.pm', # retrieve abstract from module
       AUTHOR         => 'blair christensen. <blair@devclue.com>') : ()),
);
