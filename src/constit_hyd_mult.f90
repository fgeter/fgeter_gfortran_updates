      subroutine constit_hyd_mult (iob, idr)
 
      use constituent_mass_module
      use dr_module

      implicit none
      
      integer, intent (in)  :: idr
      integer, intent (in)  :: iob
      integer :: idr_pest = 0
      integer :: ipest = 0
      integer :: idr_path = 0
      integer :: ipath = 0
      integer :: idr_hmet = 0
      integer :: ihmet = 0
      integer :: idr_salt = 0
      integer :: isalt = 0
      
      idr_pest = dr_pest_num(idr)
      do ipest = 1, cs_db%num_pests
        obcs(iob)%hd(1)%pest(ipest) =  obcs(iob)%hin(1)%pest(ipest) * dr_pest(idr_pest)%pest(ipest)
      end do
      
      idr_path = dr_path_num(idr)
      do ipath = 1, cs_db%num_paths
        obcs(iob)%hd(1)%path(ipath) =  obcs(iob)%hin(1)%path(ipath) * dr_path(idr_path)%path(ipath)
      end do
      
      idr_hmet = dr_hmet_num(idr)
      do ihmet = 1, cs_db%num_metals
        obcs(iob)%hd(1)%hmet(ihmet) =  obcs(iob)%hin(1)%hmet(ihmet) * dr_hmet(idr_hmet)%hmet(ihmet)
      end do
      
      idr_salt = dr_salt_num(idr)
      do isalt = 1, cs_db%num_salts
        obcs(iob)%hd(1)%salt(isalt) =  obcs(iob)%hin(1)%salt(isalt) * dr_salt(idr_salt)%salt(isalt)
      end do
      
      return
      end subroutine constit_hyd_mult