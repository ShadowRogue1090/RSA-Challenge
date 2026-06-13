Below is the command history from testing making my encrypt and decrypt scripts ELF executables rather than just bash scripts.
Despite the many commands, this experiment failed and I was forced to return to a previous git commit and accept the vulnerability in the system.

---

504 cd Alice/
505 vim Dockerfile
506 bat encrypt.sh
507 ls
508 cd alice-files/
509 bat encrypt.sh
510 bat decrypt.sh
511 cd ../..
512 vim Alice/Dockerfile
513 docker build -t user ./Alice/
514 docker run -d --name "$USER_CONTAINER" -p 2222:22 Alice
  515  docker run -d   --name "$USER*CONTAINER" -p 2222:22 user
516 ssh alice@localhost -p 2222
517 cd Alice/
518 ls
519 bat Dockerfile
520 ssh alice@localhost -p 2222
521 cd ..
522 ./remove-challenge.sh
523 docker network ls
524 docker image ls
525 docker container ls
526 docker rm -f 91d3c71096c6
527 docker rmi -f 31cede098166
528 ls
529 clear
530 ls
531 cd Alice/
532 ls
533 bat Dockerfile
534 nano Dockerfile
535 cd ..
536 docker build -t user ./Alice/
537 docker run -d --name "$USER_CONTAINER" -p 2222:22 user
  538  ssh alice@localhost -p 2222
  539  ./remove-challenge.sh 
  540  docker container kill *
  541  docker container ls
  542  docker container kill infallible_dhawan 
  543  docker container rm condescending_hopper infallible_dhawan 
  544  docker image ls
  545  docker rmi user:latest 
  546  clear
  547  nano Alice/Dockerfile 
  548  cd Alice/
  549  ls
  550  docker build .
  551  docker image ls
  552  docker ps
  553  docker image ls
  554  docker container ls
  555  docker build -t alice .
  556  docker image ls
  557  docker run -p 2222:22 alice
  558  docker container s
  559  docker container ls
  560  docker kill alice && docker rm alice
  561  docker kill happy_wright 
  562  docker rm happy_wright 
  563  docker run -d -p 2222:22 alice
  564  ssh alice@localhost -p 2222
  565  cd ..
  566  docker kill hopeful_hugle 
  567  docker rm hopeful_hugle 
  568  docker rmi alice:latest 
  569  clear
  570  cd Alice/alice-files/
  571  ls
  572  cat encrypt.sh 
  573  cd ..
  574  ls
  575  vim Dockerfile 
  576  cd alice-files/
  577  ls
  578  bat decrypt.sh 
  579  ls
  580  bat encrypt.sh 
  581  shc
  582  shc -f encrypt.sh 
  583  ls
  584  bat encrypt.sh.x
  585  cat encrypt.sh.x
  586  strings encrypt.sh.x
  587  clear
  588  ls
  589  shc -f decrypt.sh 
  590  ls
  591  cat decrypt.sh.x.c 
  592  ls
  593  clear
  594  ls
  595  ./encrypt.sh 
  596  ./decrypt.sh 
  597  clear
  598  ls
  599  cd ..
  600  cd META/
  601  ls
  602  bat *
  603  clear
  604  ls
  605  cd ..
  606  cd Alice/
  607  ls
  608  bat Dockerfile 
  609  nano Dockerfile 
  610  cd ..
  611  git add .
  612  git commit -m "fixed script perms?"
  613  git push origin main
  614  ./setup-challenge.sh 
  615  ssh alice@localhost -p 2222
  616  ./remove-challenge.sh 
  617  nano Alice/Dockerfile 
  618  ./setup-challenge.sh 
  619  ssh alice@localhost -p 2222
  620  ./remove-challenge.sh 
  621  docker container ls
  622  docker image ls
  623  nano Alice/Dockerfile 
  624  ./setup-challenge.sh 
  625  ssh alice@localhost -p 2222
  626  ./remove-challenge.sh 
  627  nano Alice/Dockerfile 
  628  ./setup-challenge.sh 
  629  ./remove-challenge.sh 
  630  bat Alice/Dockerfile 
  631  nano Alice/Dockerfile 
  632  ./setup-challenge.sh 
  633  ssh alice@localhost -p 2222
  634  ./remove-challenge.sh 
  635  bat Alice/Dockerfile 
  636  ./setup-challenge.sh 
  637  ./remove-challenge.sh 
  638  vim Alice/Dockerfile 
  639  ./setup-challenge.sh 
  640  ./remove-challenge.sh 
  641  ./setup-challenge.sh 
  642  ssh alice@localhost -p 2222
  643  tree
  644  cd META/
  645  nano executable-maker.sh
  646  chmod +x executable-maker.sh 
  647  ls
  648  ./executable-maker.sh 
  649  ls
  650  bat decrypt.sh 
  651  ./executable-maker.sh 
  652  cd ..
  653  tree
  654  cd META/
  655  ls
  656  ls ../Alice/alice-files/
  657  docker run --rm -v "$PWD:/src" alpine ls /src
658 ls
659 bat *
660 docker run --rm debian:bookworm-slim bash -c "
661 apt-get update &&
662 apt-get install -y shc gcc &&
663 which shc &&
664 echo 'shc OK'
665 "
666 ls
667 ./executable-maker.sh
668 ls
669 cat e
670 cat executable-maker.sh
671 ./executable-maker.sh
672 ls ../Alice/alice-files/
673 cd ..
674 ./setup-challenge.sh
675 ./remove-challenge.sh
676 ./setup-challenge.sh
677 ssh alice@localhost -p 2222
678 cd Alice/
679 ls
680 bat Dockerfile
681 ssh alice@localhost -p 2222
682 ./r
683 cd ..
684 ./remove-challenge.sh
685 cd META/
686 ls
687 rm decrypt.sh.x.c encrypt.sh.x.c
688 ls
689 bat decrypt.sh e
690 bat decrypt.sh encrypt.sh
691 cat decrypt.sh encrypt.sh
692 ls
693 nano encrypt.sh
694 ./executable-maker.sh
695 cd ..
696 ./remove-challenge.sh
697 ./setup-challenge.sh
698 ssh alice@localhost -p 2222
699 cd META/
700 ls
701 rm decrypt.sh.x.c
702 rm encrypt.sh.x.c
703 ls
704 ssh alice@localhost -p 2222
705 cd ..
706 ./remove-challenge.sh
707 nano Alice/Dockerfile
708 cd META/
709 cat executable-maker.sh
710 ./executable-maker.sh
711 cd ..
712 ls Alice/alice-files/
713 ./setup-challenge.sh
714 ssh alice@localhost -p 2222
715 ./remove-challenge.sh
716 nano Alice/Dockerfile
717 ./setup-challenge.sh
718 ssh alice@localhost -p 2222
719 ./remove-challenge.sh
720 cd Alice/alice-files/
721 ls
722 rm decrypt encrypt
723 cd ..
724 ls
725 cd META/
726 ls
727 rm decrypt.sh.x.c encrypt.sh.x.c
728 nano encrypt.sh
729 ./executable-maker.sh
730 cd ..
731 ./setup-challenge.sh
732 ssh alice@localhost -p 2222
733 ./remove-challenge.sh
734 cd META
735 ls
736 bat encrypt.sh decrypt.sh
737 ./executable-maker.sh
738 cd ..
739 cd META/
740 ls
741 bat executable-maker.sh
742 nano executable-maker.sh
743 ls
744 rm decrypt.sh.x.c encrypt.sh.x.c
745 cd ..
746 cd Alice/
747 cd alice-files/
748 ls
749 rm encrypt decrypt
750 cd ..
751 cd META/
752 ls
753 ./executable-maker.sh
754 ls
755 rm encrypt.sh.x.c
756 nano executable-maker.sh
757 ./executable-maker.sh
758 ls ../Alice/alice-files/
759 nano executable-maker.sh
760 ./executable-maker.sh
761 nano executable-maker.sh
762 cat executable-maker.sh
763 ./executable-maker.sh
764 cd ..
765 ls
766 cd Alice/alice-files/
767 s
768 ls
769 cd ..
770 cd META/
771 ls
772 cd ..
773 ./remove-challenge.sh
774 ./setup-challenge.sh
775 ssh alice@localhost -p 2222
776 ./remove-challenge.sh
777 ls
778 cd META/
779 ls
780 ./executable-maker.sh
781 ;s ../Alice/alice-files/
782 ls ../Alice/alice-files/
783 cd ..
784 ./setup-challenge.sh
785 ssh alice@localhost -p 2222
786 ./remove-challenge.sh
787 cd Alice/alice-files/
788 ls
789 rm decrypt encrypt
790 cd ..
791 cd META/
792 ls
793 rm decrypt.sh.x.c
794 rm encrypt.sh.x.c
795 ls
796 clear
797 ls
798 nano encrypt.sh
799 nano decrypt.sh
800 nano encrypt.sh
801 ./executable-maker.sh
802 cd ..
803 ./setup-challenge.sh
804 ssh alice@localhost -p 2222
805 ./remove-challenge.sh
806 clear
807 ls
808 cd META/
809 ls
810 nano executable-maker.sh
811 cd ..
812 cd Alice/
813 nano Dockerfile
814 cd ..
815 ls
816 cd META/
817 ls
818 rm decrypt.sh.x.c
819 rm encrypt.sh.x.c
820 ls
821 cd ..
822 clear
823 ls
824 tree
825 ./setup-challenge.sh
826 ssh alice@localhost -p 2222
827 ls
828 cd Alice/
829 ls
830 cd s
831 cd alice-files/
832 ls
833 rm decrypt
834 rm encrypt
835 cd ..
836 cd META/
837 ls
838 nano decrypt.sh
839 nano encrypt.sh
840 nano executable-maker.sh
841 ls
842 ./executable-maker.sh
843 cd ..
844 ./setup-challenge.sh
845 ./remove-challenge.sh
846 ./setup-challenge.sh
847 ls
848 ssh alice@localhost -p 2222
849 ls
850 ./remove-challenge.sh
851 cd Alice/
852 ls
853 cd alice-files/
854 ls
855 rm decrypt encrypt
856 cd ..
857 ls
858 cd META/
859 ls
860 rm decrypt.sh.x.c encrypt.sh.x.c
861 nano executable-maker.sh
862 history
863 nano executable-maker.sh
864 ls
865 ./executable-maker.sh
866 ls
867 cd ..
868 cd Alice/
869 cd alice-files/
870 ./encrypt
871 ./decrypt
872 cd ..
873 cd Alice/
874 cd alice-files/
875 s
876 ls
877 rm decrypt encrypt
878 cd ..
879 ls
880 cd META/
881 ls
882 nano e
883 nano executable-maker.sh
884 nano encrypt.sh
885 ./executable-maker.sh
886 ../Alice/alice-files/encrypt
887 ../Alice/alice-files/decrypt
888 cd ..
889 ./setup-challenge.sh
890 ssh alice@localhost -p 2222
891 ls
892 ./remove-challenge.sh
893 clear
894 ls
895 cd META/
896 ls
897 bat executable-maker.sh
898 ./executable-maker.sh
899 ls
900 cd ..
901 ./setup-challenge.sh
902 ssh alice@localhost -p 2222
903 cd Alice/alice-files/
904 ./encrypt
905 cd ..
906 cd META/
907 ls
908 bat executable-maker.sh
909 clear
910 env -i ./decrypt
911 ssh alice@localhost -p 2222
912 cd ../Alice/alice-files/
913 env -i ./decrypt
914 cd ..
915 cd alice-files/
916 ls
917 rm decrypt encrypt
918 cd ..
919 ls
920 ./remove-challenge.sh
921 clear
922 ls
923 cd META/
924 ls
925 ./executable-maker.sh
926 ls
927 cd build/
928 ls
929 ./encrypt
930 cd ..
931 ls
932 cd ..
933 cd Alice/
934 cd alice-files/
935 ls
936 cd ..
937 ./setup-challenge.sh
938 ssh alice@localhost -p 2222
939 ./remove-challenge.sh
940 cd META/
941 ls
942 rm -r build/
943 ls
944 rm decrypt.sh.x.c
945 rm encrypt.sh.x.c
946 ls
947 ./executable-maker.sh
948 ls
949 cd build/
950 ls
951 cd ..
952 cd ../Alice/alice-files/
953 ls
954 ./encrypt.sh
955 file encrypt.sh
956 ./encrypt.sh
957 ./decrypt.sh
958 cd ..
959 ls
960 ./remove-challenge.sh
961 ./setup-challenge.sh
962 ssh alice@localhost -p 2222
963 cd META/
964 ls
965 bat executable-maker.sh
966 ls ../Alice/alice-files/
967 file ../Alice/alice-files/\_
968 ls -l ../Alice/alice-files/
969 ls
970 rm build/
971 rm -r build/
972 rm ../Alice/alice-files/decrypt.sh
973 rm ../Alice/alice-files/encrypt.sh
974 ./executable-maker.sh
975 ls
976 cd build/
977 ls
978 cd ..
979 cd ../Alice/alice-files/
980 ls
981 cd ..
982 ls
983 cd Alice/alice-files/
984 ls
985 chmod +x decrypt.sh encrypt.sh
986 ls
987 cd ../..
988 ls
989 clear
990 ls
991 git add .
992 git commit -m "undoing executables"
993 git push
994 git push origin main
995 ls
996 ./remove-challenge.sh
997 ./setup-challenge.sh
998 ssh alice@localhost -p 2222
999 ./remove-challenge.sh
1000 exit
1001 cd School-Work/Networking/2026/Docker/
1002 ls
1003 clear
1004 ls
1005 glow README.md
1006 ./setup-challenge.sh
1007 ssh alice@localhost -p 2222
1008 ssh hackerbot9001@localhost -p 2224
